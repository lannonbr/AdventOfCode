# read in people
# 
# create a map
#
# Alice {
#   bob: -2
#   carol: -62
#   david: 65
#   eric: 21
#   frank: -81
#   george: -4
#   mallory: -80
# }
#
# set people into array 
#
# 0th element and n-1 element in array are next to eachother.
#
# calculate total change, if it is highest, set it as highest and shuffle and
# go again. do for 10,000 times
def find_hapiness(people, map)
  hap = 0
  new_map = {}

  people.each do |person|
    new_map[person] = []
  end
  
  people.each_with_index do |person, idx|
    left = map[person][people[idx-1]]
    right = idx == people.length-1 ? map[person][people[0]] : map[person][people[idx+1]]
    new_map[person] << left
    new_map[person] << right
  end

  people.each { |i| hap += new_map[i].inject(0, :+) }

  hap
end

top_hap = -10_000
map = {}

people = %w[Alice Bob Carol David Eric Frank George Mallory]
people.each do |person|
  map[person] = {}
end
map["Me"] = {}

input = File.open('input.dat', 'r').readlines
input.each do |i|
  i.chomp!.chomp!
  line = i.split(" ")
  subject = line[0]
  units = line[2] == "gain" ? line[3].to_i : - 1 * line[3].to_i
  next_to = line[-1].match(/[a-zA-Z]+/)[0]

  map[subject][next_to] = units

end

people << "Me"

people.each do |person|
  map[person]["Me"] = 0 if person != "Me"
  map["Me"][person] = 0 if person != "Me"
end


50000.times do
  people.shuffle!
  hap = find_hapiness(people, map)
  if hap > top_hap
    top_hap = hap
  end
end

puts top_hap
