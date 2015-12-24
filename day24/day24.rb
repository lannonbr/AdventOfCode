arr = []

File.open("input.dat") do |f|
  arr = f.readlines.map(&:to_i)
end

max_weight = arr.inject(:+) / 4

qes = []

(1..arr.size+1).each do |i|
  arr.combination(i).each do |comb|
    if comb.inject(:+) == max_weight
      qes << comb
      puts i
    end
  end
end

qes.map!{|qe| qe.inject(:*)}
puts qes.min
