# Day 17 of Advent of Code
array = File.open("input.dat").readlines.map{|item|item.chomp.to_i}

class Array
  def powerset
    inject([[]]) do |ps, item|
      ps + ps.map { |e| e + [item] }
    end
  end
end


combinations = array.powerset.select { |ps| ps.inject(:+) == 150 }
puts combinations.length

min = 1000
combinations.each do |comb|
  if comb.length < min
    min = comb.length
  end
end

combinations.select!{ |ps| ps.length == min }
puts combinations.length
