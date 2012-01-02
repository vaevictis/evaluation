#!/usr/bin/ruby

def build_node(array, space_size=0)
  current_element = array.shift
  space_size.times { putc "\s" }
  puts "<" + current_element.to_s + ">"
  puts

  unless array.empty?
    build_node(array, space_size + 2)
    puts
  end

  space_size.times { putc "\s" }
  puts "</" + current_element.to_s + ">"
end

# Quits with explaining expected input
if ARGV.length != 1
  puts "Please, 1 param is expected"
  puts "Usage: ./exercise4.rb \"['array', 'of', 'interresting', 'values']\""
  exit
end

array = eval ARGV[0]
build_node(array)
