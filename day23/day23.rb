# Day 23 of Advent of Code
class Computer
  attr_accessor :a, :b, :instructions

  def initialize
    @a = 0
    @b = 0
    @instructions = []
    @pc = 0
  end

  def load_from_file(filename)
    @instructions = File.open(filename).readlines.map(&:chomp)
  end

  def reset
    @a = 0
    @b = 0
    @pc = 0
  end

  def execute
    while @pc < @instructions.size
      current_instruction = @instructions[@pc]
      instruct_array = current_instruction.split " "
      instruction = instruct_array[0]
      case instruction
      when "hlf"
        halve instruct_array[1]
      when "tpl"
        triple instruct_array[1]
      when "jie"
        puts "INSTRUCT: JUMP IF EVEN"
        if instruct_array[1][0] == "a"
          if @a % 2 == 0
            movePC instruct_array[2]
            next
          end
        elsif instruct_array[1][0] == "b"
          if @b % 2 == 0
            movePC instruct_array[2]
            next
          end
        end
      when "jio"
        puts "INSTRUCT: JUMP IF ONE"
        if instruct_array[1][0] == "a"
          if @a == 1
            movePC instruct_array[2]
            next
          end
        elsif instruct_array[1][0] == "b"
          if @b == 1
            movePC instruct_array[2]
            next
          end
        end
      when "jmp"
        puts "INSTRUCT: JUMP"
        movePC instruct_array[1]
        next
      when "inc"
        puts "INSTRUCT: INCREMENT"
        if instruct_array[1] == "a"
          @a += 1
        elsif instruct_array[1] == "b"
          @b += 1
        end
      end
      @pc += 1
    end
  end

  def view_registers
    puts "Register a: #@a"
    puts "Register b: #@b"
  end

  private

  def halve(register)
    puts "INSTRUCT: HALF"
    if register == "a"
      @a -= (@a / 2).to_i
    elsif register == "b"
      @b -= (@b / 2).to_i
    end
  end

  def triple(register)
    puts "INSTRUCT: TRIPLE"
    if register == "a"
      @a *= 3
    elsif register == "b"
      @b *= 3
    end
  end

  def movePC(length)
    if length[0] == "+"
      @pc += length[1..-1].to_i
    elsif length[0] == "-"
      @pc -= length[1..-1].to_i
    end
  end
end

# Part 1

comp = Computer.new
comp.load_from_file "input.dat"

comp.execute
comp.view_registers

# Part 2

comp.reset
comp.a = 1

comp.execute
comp.view_registers
