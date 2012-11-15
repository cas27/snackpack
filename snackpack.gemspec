Gem::Specification.new do |s|
  s.name = 'snackpack'
  s.version = '0.1.8'
  s.date = '2012-11-15'
  s.summary = 'Downloads and packages RubyTapas locally'
  s.description = <<-EOF
    Snackpack logs into your RubyTapas subscription and downloads
    all the available episodes with their supporting files onto your local
    computer. While also injecting the videos into the html files for easier
    viewing.
  EOF
  s.authors = ['Cory Schmitt']
  s.email = 'cory@schmitty.me'
  s.files = Dir["lib/**/*"]
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/cas27/snackpack'
  s.executables << 'snackpack'
end
