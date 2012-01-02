#!/usr/bin/ruby
include Math
require 'shape'

# This script reads a CSV file with information about different regular polygons
# (all sides equal), and circles.
# Each row of the file contains the name of the polygon and its side length,
# in order.
# Acceptable polygons include:
# - triangle
# - square
# - pentagon
# Circle are accepted but CSV dimension refers to its radius.

# Quits with explaining expected input unless file is provided
if ARGV.length != 1
  puts "Please, 1 param is expected"
  puts "Usage: ./exercise2.rb YourInputFile\n"
  puts "Hint: try ./exercise2.rb exercise2.csv ;-)\n"
  exit
end

# Opens the file
# Not very resilient to badly formatted csv or unsupported shapes.
File.readlines(ARGV[0]).each do |line|
  shape, dimension = line.split(',')
  polygon = Kernel.eval(shape.capitalize!).new(dimension)

  puts polygon.output_sentence
end
