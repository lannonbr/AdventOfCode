arr = Array.new(4000) { Array.new(4000, 0) }

posx = 300
posy = 300

arr[posx][posy] += 1

File.open("houses.dat", "r") do |f|
  inner = f.read.split("")

  inner.each do |i|
    case i
    when '^'
      posy -= 1
    when 'v'
      posy += 1
    when '<'
      posx -= 1
    when '>'
      posx += 1
    end

    arr[posx][posy] += 1
  end
end

total = 0

arr.each do |row|
  row.each do |col|
    if col > 0
      total += 1
    end
  end
end

puts total
