class Condiments
  def initialize(snack_store, condiment)
    @snack = snack_store
    @condiment = <<-EOF
      <center>
      <video width="960" height="540" controls="controls">
        <source src="#{condiment}" type="video/mp4">
        Your browser does not support el video tag.
      </video>
      </center>
      EOF
  end

  def add
    super_snack = Tempfile.new('super_snack')
    File.open(@snack) do |f|
      while line = f.gets
        super_snack.puts line
        if line.match(/<h1 class/)
          super_snack.puts @condiment
        end
      end
    end
    FileUtils.mv(super_snack.path, @snack)
  end
end
