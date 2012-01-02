#!/usr/bin/ruby

require 'html_indenter'
require 'text_block'

# Quits with explaining expected input
if ARGV.length != 1
  puts "Please, 1 param is expected"
  puts "Usage: ./exercise3.rb '<a><string><of><valid><html></html></valid></of></string></a>'"
  exit
end

text_block = TextBlock.new(ARGV[0])
text_block.check_tags_symetry
text_block.to_indentable_array

HtmlIndenter.build_node(text_block.to_indentable_array)

