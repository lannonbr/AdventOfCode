# Day 5 of Advent of Code

class NiceStrChecker
  def initialize(str)
    @str = str
  end

  def nice?
    bad = (@str =~ /ab|cd|pq|xy/)
    double = (@str =~ /([a-z])\1/)
    triple_vowel = (@str =~ /[aeiou].*[aeiou].*[aeiou]/)
    
    !bad && double && triple_vowel
  end

  def letter_between
    /(.).\1/.match(@str)
  end

  def appear_twice
    /(..).*\1/.match(@str)
  end

  def two_nice?
    letter_between && appear_twice
  end
end

total = 0

File.open('nicestr.dat').readlines.each do |line|
  checker = NiceStrChecker.new(line)
  total += 1 if checker.nice?
end

puts "Part 1: #{total}"

total = 0

File.open('nicestr.dat').readlines.each do |line|
  checker = NiceStrChecker.new(line)
  total += 1 if checker.two_nice?
end

puts "Part 2: #{total}"
