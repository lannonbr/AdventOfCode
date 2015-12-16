# Day 16 of Advent of Code
$mfcsam_result = {
  children: 3, cats: 7, samoyeds: 2,
  pomeranians: 3, akitas: 0, goldfish: 5,
  trees: 3, cars: 2, perfumes: 1
}

def check(sue, key)
  doesnt_have_key(sue, key) || check_if_key_exists(sue, key)
end

def doesnt_have_key(sue, key)
  !sue.has_key?(key)
end

def check_if_key_exists(sue, key)
  check_tree_and_cats(sue, key) || check_pom_and_goldfish(sue, key) || check_other(sue, key)
end

def check_tree_and_cats(sue, key)
  [:trees, :cats].include?(key) && sue[key] > $mfcsam_result[key]
end

def check_pom_and_goldfish(sue, key)
  [:pomeranians, :goldfish].include?(key) && sue[key] < $mfcsam_result[key]
end

def check_other(sue, key)
  sue[key] == $mfcsam_result[key]
end

def create_sue_map(line)
  num_regex = /(\d+)/

  current_sue = {}
  data = line.split /[:|,]/
  num = num_regex.match(data[0])[0]
  current_sue[:num] = num
  data = data[1..-1]

  idx = 0
  while idx < data.length
    key = data[idx].strip.to_sym
    val = num_regex.match(data[idx+1])[0].to_i

    current_sue[key] = val
    idx += 2
  end

  current_sue
end

def print_sues(sues)
  sues.each {|sue| puts sue.to_s }
end

input = File.open("input.dat", "r").readlines

sues = []

input.each do |line|
  current_sue = create_sue_map(line)
  sues << current_sue
end

$mfcsam_result.keys.each{|key| sues.select!{|sue| check(sue, key)}} 

print_sues(sues)
