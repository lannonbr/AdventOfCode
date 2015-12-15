stringArray = []

File.open('input.dat', 'r') do |f|
  f.readlines.each do |line|
    stringArray << line.chomp
  end
end

fullLength = []
reducedLength = []
extendedLength = []

stringArray.each do |str|
  fullLength << str.length
  new_str = str[1..-2]
  new_str.gsub!("\\\"", "Q")
  new_str.gsub!("\\\\", "S")
  new_str.gsub!(/\\x[a-z0-9][a-z0-9]/, "H")
  reducedLength << new_str.length
  puts new_str

  pt2_str = "\""
  str.each_char do |c|
    case c
    when /[a-z0-9]/
      pt2_str << c
    when /\\/
      pt2_str << "\\\\" 
    when /\"/
      pt2_str << "\\\""
    end
  end
  pt2_str << "\""

  extendedLength << pt2_str.length
end

puts fullLength.inject(:+) - reducedLength.inject(:+)
puts extendedLength.inject(:+) - fullLength.inject(:+)
