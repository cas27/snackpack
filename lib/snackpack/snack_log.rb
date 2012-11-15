class SnackLog
  def initialize(stomach)
    @stomach = stomach
    @temp_menu = Tempfile.new('temp_menu')
    @snack_log = @stomach+'snack_log.html'
  end

  def build
    Dir[@stomach+'*'].each do |folder|
      menu = fetch_menu(folder)
      write_log(menu)
    end
    FileUtils.mv(@temp_menu.path, @snack_log)
  end

  private
  def fetch_menu(folder)
    Dir[folder+'/*.html']
  end

  def write_log(menu)
    File.open(@temp_menu, 'a') do |f|
      menu_title = get_title(menu.first) if menu.first
      f.puts "<p><a href='#{menu.first}'>#{menu_title}</a></p>"
    end
  end

  def get_title(menu)
    title = menu.match(/[-]\d+.+[html]$/).to_s
    title.gsub!(/\d/, '')
    title.gsub!(/-/, ' ')
    title.gsub!(/\//, '')
    title.gsub!(/\./, '')
    title.gsub!(/html/, '')
  end
end
