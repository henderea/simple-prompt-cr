require "option_parser"
require "colorize"
require "fancyline"

opts = {:message => ""}
OptionParser.parse { |parser|
  parser.on("-m MESSAGE", "--message", "Specify message") { |message|
    opts[:message] = message
  }
}

message = "#{"?".colorize(:green)} #{opts[:message].colorize.bold} "

rl = Fancyline.new(STDIN, STDERR)

begin
  answer = rl.readline(message)
rescue Fancyline::Interrupt
  exit(130)
end

print answer
