def wrapping(l, w, h)
  lw = l * w
  lh = l * h
  wh = w * h
  arr = [lw, lh, wh]
  2*lw + 2*lh + 2*wh + arr.min
end

def ribbon(l, w, h)
  arr = [l,w,h]
  one = arr.delete_at(arr.index(arr.min))
  two = arr.delete_at(arr.index(arr.min))
  puts "One: #{one}"
  puts "Two: #{two}"
  one + one + two + two + (l*w*h)
end

puts ribbon(2,3,4)

total = 0

file = File.open("wrap.dat", "r") do |f|
  f.readlines.each do |line|
    arr = line.split('x')
    total += ribbon(arr[0].to_i, arr[1].to_i, arr[2].to_i)
  end
end

puts total
