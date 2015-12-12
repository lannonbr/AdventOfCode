# Day 12 of Advent of Code
require 'json'

# pt 1
File.open('json.dat', 'r') { |f| puts f.readline.scan(/-?[0-9]+/).map{|str| str.to_i }.inject(0, &:+) }

# pt 2
def parse(input)
  sum = 0
  case input
  when Hash
    return 0 if input.values.include? "red"
    input.keys.each { |key| sum += input[key].is_a?(Fixnum) ? input[key] : parse(input[key]) }
  when Array
    input.each { |val| sum += val.is_a?(Fixnum) ? val : parse(val) }
  when Fixnum
    sum += input
  end
  return sum
end

input = JSON.load(File.read('json.dat'))
puts parse(input)
