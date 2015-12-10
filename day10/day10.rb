def next_it(str)
  foo = str.strip.scan /((.)\2*)/
  new_str = ""
  foo.each do |i|
    # puts "#{i[0]}, #{i[1]}"
    new_str << i[0].length.to_s
    new_str << i[1]
  end

  new_str
end

input = "3113322113"

50.times do |i|
  input = next_it input
end

puts input.length
