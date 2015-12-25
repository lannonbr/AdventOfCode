initial_value = 20151125
array = Array.new(20000) { Array.new(20000, nil) }

array[0][0] = initial_value

row = 0
col = 0

new_value = initial_value

def looping(new_value, array)
  i = 1
  loop do
    row = i
    col = 0

    until row == -1
      new_value *= 252533
      new_value %= 33554393
      array[row][col] = new_value
      row -= 1
      col += 1

      if not array[3009][3018].nil?
        return array[3009][3018]
      end
    end

    i += 1

  end
end

puts looping(new_value, array)
puts array[3009][3018]
