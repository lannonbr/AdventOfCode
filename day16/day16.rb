# Day 16 of Advent of Code
mfcsam_result = {
  children: 3,
  cats: 7,
  samoyeds: 2,
  pomeranians: 3,
  akitas: 0,
  goldfish: 5,
  trees: 3,
  cars: 2,
  perfumes: 1
}

input = File.open("input.dat", "r").readlines

sues = []

input.each do |sue|
  data = sue.split /[:|,]/
  current_sue = {}
  num = /(\d+)/.match(data[0])[0]
  data = data[1..-1]

  idx = 0
  while idx < data.length
    key = data[idx].strip
    val = /(\d+)/.match(data[idx+1])[0]
    current_sue[key.to_sym] = val.to_i
    idx += 2
  end

  current_sue[:num] = num
  sues << current_sue
end


keys = mfcsam_result.keys
i = 0
while i < keys.size
  new_sues = []
  sues.each do |sue|
    if sue.has_key?(keys[i])
      if keys[i] == :cats || keys[i] == :trees
        new_sues << sue if sue[keys[i]] > mfcsam_result[keys[i]]
      elsif keys[i] == :pomeranians || keys[i] == :goldfish
        new_sues << sue if sue[keys[i]] < mfcsam_result[keys[i]]
      else
       if sue[keys[i]] == mfcsam_result[keys[i]]
         new_sues << sue
       end
      end
    else
      new_sues << sue
    end
  end

  i += 1

  puts "Number of remaining Sues: #{new_sues.size}"
  sues = new_sues
  puts sues.size
end

sues.each {|sue| puts sue.to_s }
