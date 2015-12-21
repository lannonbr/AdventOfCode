# Day 18 of Advent of Code
class Grid
  attr_accessor :buff, :size
  
  def initialize(size, two = false)
    @size = size
    @buff = Array.new(@size) { Array.new(@size, 0) }
    @two = two
  end

  def print_grid
    @buff.each do |row|
      row.each do |item|
        print item
      end
      puts ""
    end
    puts "\n"
  end

  def load(filename)
    File.open(filename) do |f|
      input_array = f.readlines
      y = 0
      input_array.each do |line|
        x = 0
        line.each_char do |c|
          @buff[y][x] = (c == '#') ? 1 : 0
          x += 1
        end
        y += 1
      end
    end
  end

  def step
    old_grid = Marshal.load(Marshal.dump(@buff))
    (0..@size-1).each do |y|
      (0..@size-1).each do |x|
        step_light(@buff, old_grid, y, x)
      end
    end
  end
end

def step_light(gro, grid, y, x)
  on_neighbors = 0

  (-1..1).each do |dy|
    (-1..1).each do |dx|
      if (y + dy) > -1 && (y + dy) < grid.size
        if (x + dx) > -1 && (x + dx) < grid.size
          if grid[y + dy][x + dx] == 1
            if dy == 0 && dx == 0
              next
            else
              on_neighbors += 1
            end
          end
        end
      end
    end
  end
  
  if @two
    if [[0,0], [grid.size-1,0], [0, grid.size-1], [grid.size-1, grid.size-1]].include?([y, x])
      return
    elsif grid[y][x] == 1 && !([2,3].include?(on_neighbors))
      gro[y][x] = 0
    elsif grid[y][x] == 0 && on_neighbors == 3
      gro[y][x] = 1
    end
  else
    if grid[y][x] == 1 && !([2,3].include?(on_neighbors))
      gro[y][x] = 0
    elsif grid[y][x] == 0 && on_neighbors == 3
      gro[y][x] = 1
    end
  end
end

real = Grid.new(100)
real.load("input.dat")

100.times { |i| real.step }

puts "Pt 1:"
puts real.buff.flatten.select{ |i| i == 1 }.length

real2 = Grid.new(100, true)
real2.load("input2.dat")

100.times { |i| real2.step }

puts "Pt 2:"
puts real2.buff.flatten.select{ |i| i == 1 }.length
