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
end

total = 0

File.open('nicestr.dat', 'r').readlines.each do |line|
  checker = NiceStrChecker.new(line)
  total += 1 if checker.nice?
end

puts total
