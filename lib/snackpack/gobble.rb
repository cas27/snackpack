class Gobble

  def initialize(snack_pack, snacker, stomach)
    @snack_pack = snack_pack
    @snacker = snacker
    @stomach = stomach
  end

  def eat
    choice_snacks = pick_choice_snacks
    consume_snacks(choice_snacks)
  end

  private
  def pick_choice_snacks
    @snack_pack.links_with(:href => /download/)
  end

  def consume_snacks(snacks)
    title = @snack_pack.search('h2').inner_text.downcase.gsub(/ /, '-')
    id = @snack_pack.uri.to_s.match(/\d+/).to_s
    tupaware = title + '-' + id + '/'

    condiment = snacks.select { |s| s.text.match(/mp4/) }

    snacks.each do |snack|
      snack_store = @stomach + tupaware + snack.text 
  
      # dont download file twice
      unless FileTest.exists?(snack_store)
        snack.click.save(snack_store)
        if snack.text.match(/html/)
          Condiments.new(snack_store, condiment.first.text).add
        end
      end
    end
  end

end
