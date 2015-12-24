# Day 19 of Advent of Code
replacements = []

def load_data
  replacements = []
  original_mol = ""
  File.open("input.dat") do |f|
    f.readlines.each do |line|
      if line.size > 80
        original_mol = line
      else
        curr_rep = line.split(" ")
        replacements << [curr_rep[0], curr_rep[2]]
      end
    end
  end
  [original_mol, replacements]
end

out = load_data
original_mol = out[0]
replacements = out[1]

molecules = []

replacements.each do |rep|
  mol_array = original_mol.split(/([A-Z][a-z]*)/).delete_if(&:empty?)
  mol_array.each_with_index do |mol, i|
    if mol == rep[0]
      tmp = mol_array[i]
      mol_array[i] = rep[1]
      molecules << mol_array.join("")
      mol_array[i] = tmp
    end
  end
end

puts molecules.uniq.size
