#!/usr/bin/ruby
require 'html_indenter'
include HtmlIndenter

# Quits with explaining expected input
if ARGV.length != 1
  puts "Please, 1 param is expected"
  puts "Usage: ./exercise4.rb \"['array', 'of', 'interresting', 'values']\""
  exit
end

array = eval ARGV[0]
build_node(array, 0, true)
