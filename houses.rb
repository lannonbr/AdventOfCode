arr = Array.new(4000) { Array.new(4000, 0) }

rposx = 300
rposy = 300

posx = 300
posy = 300

arr[posx][posy] += 1
arr[rposx][rposy] += 1

ticker = [0,1].cycle

File.open("houses.dat", "r") do |f|
  inner = f.read.split("")

  inner.each do |i|
    if ticker.next == 0
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
    else
      case i
      when '^'
        rposy -= 1
      when 'v'
        rposy += 1
      when '<'
        rposx -= 1
      when '>'
        rposx += 1
      end
      arr[rposx][rposy] += 1
    end
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
