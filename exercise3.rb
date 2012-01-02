#!/usr/bin/ruby

# This one is a little ninja-style. Sorry, It starts to be late here.
# I mostly reused code from ex. 4 and added tweaks / hardcore validations.
# String manipulations should be using a few defined methods to help ease of
# reading instead of those cascaded chops and gsubs !

def build_node(array, space_size=0)
  current_element = array.shift
  space_size.times { putc "\s" }
  puts "<" + current_element.to_s + ">"

  unless array.empty?
    build_node(array, space_size + 2)
  end

  space_size.times { putc "\s" }
  puts "</" + current_element.to_s + ">"
end

# Quits with explaining expected input
if ARGV.length != 1
  puts "Please, 1 param is expected"
  puts "Usage: ./exercise3.rb '<a><string><of><valid><html></html></valid></of></string></a>'"
  exit
end

html_string = ARGV[0]

# Cleaning "<", ">", "/" from the input string to check symetry between beginning
# and end of the array generated from string:
# <a><b><c></c></b></a> => ["a", "b", "c", "c", "b", "a"]

symetry_string = html_string.gsub('><', ' ')
symetry_string.gsub!('<', ' ').gsub!('>', ' ').gsub!('/', '')
temp_array     = symetry_string.split
while temp_array.size != 0 do
  if temp_array.first != temp_array.last
    puts "HTML badly formatted. Please check your input string. Remember, each tag should have a matching closing one."
    exit
  end
  temp_array.shift
  temp_array.pop
end

# actually getting the bits needed to print correct indentation
substring      = html_string.gsub(/\/.*$/, '').chop.chop
substring.slice!(0)

array = substring.split('><')
build_node(array)
