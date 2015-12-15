# Day 9 of Advent of Code
input = []
File.open("input.dat", "r") { |f| input = f.readlines }
map = {}

input.each do |line|
  data = line.split(" ")
  initial = data[0]
  final = data[2]
  map[initial] = {} if map[initial].nil?
  map[final] = {} if map[final].nil?
  len = data[-1].to_i

  map[initial][final] = len
  map[final][initial] = len
end

order = map.keys.to_a.shuffle!

shortDist = 99999
longDist = 0

50000.times do
  order.shuffle!
  dist = 0
  order.each_with_index do |place, idx|
    if idx != order.length - 1
      dist += map[place][order[idx+1]]
    end
  end
  if dist < shortDist
    shortDist = dist
  end

  if dist > longDist
    longDist = dist
  end
end

puts shortDist
puts longDist
