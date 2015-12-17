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

min = combinations.min_by { |x| x.length }.length

combinations.select!{ |ps| ps.length == min }
puts combinations.length
