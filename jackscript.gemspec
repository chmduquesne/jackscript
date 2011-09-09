$LOAD_PATH.unshift 'lib'
require "jackscript/version"

Gem::Specification.new do |s|
  s.name              = "jackscript"
  s.version           = JackScript::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "A tribute to the shining, brainfuck style"
  s.homepage          = "https://github.com/tombell/trollscript"
  s.email             = "tomb@tombell.org.uk"
  s.authors           = [ "Tom Bell" ]
  s.has_rdoc          = false

  s.files             = %w( README.md )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")
  s.files            += Dir.glob("test/**/*")

  s.executables       = %w( jackscript bf2ts )
  s.description       = <<desc
  JackScript is a dialect of Brainfuck based on various capitalizations of "All work and no play makes Jack a dull boy".
desc
end
