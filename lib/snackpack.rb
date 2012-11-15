require 'mechanize'
require 'yaml'
require 'tempfile'
require 'fileutils'

require_relative 'snackpack/gobble.rb'
require_relative 'snackpack/condiments.rb'

class Snackpack

  def initialize
    @config = YAML.load_file('snackpack.yml')
    @email = ARGV[0]
    @password = ARGV[1]
    @snacker = Mechanize.new
    @snacker.pluggable_parser.default = Mechanize::Download
    @kitchen = @snacker.get('https://rubytapas.dpdcart.com/subscriber/content')
  end

  def enter_avdis_kitchen
    open_fridge
    unwrap_snacks(get_snackpacks)
    #TODO build_the_menu (build index linking to all episodes)
  end

  private
  def open_fridge
    fridge = @kitchen.forms[0]
    fridge.username = @email
    fridge.password = @password
    @kitchen = fridge.submit fridge.buttons.first
  end

  def get_snackpacks
    # TODO check expiration date
    # have we already eaten these?
    @kitchen.links_with(:text => /Attachments/)
  end

  def unwrap_snacks(snackpacks)
    snackpacks.each do |pack|
      @snack_pack = pack.click
      Gobble.new(@snack_pack, @snacker, @config[:stomach]).eat
    end
  end

end
