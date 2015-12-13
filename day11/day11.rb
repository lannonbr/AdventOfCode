$cons_arr = ('a'..'z').each_cons(3).map { |i| i.join("") }
  
def three_consec(pass)
  $cons_arr.each do |cons|
    return true if pass.match(cons)
  end
  return false
end

def two_pairs(pass)
  return true if pass.scan(/(.)\1+/).length == 2
  false
end

def valid?(pass)
  three_consec(pass) && pass.match(/[iol]/).nil? && two_pairs(pass)
end

pass = "hepxcrrq"

loop do
  pass.succ!
  break if valid?(pass)
end

puts pass # Pt 1

loop do
  pass.succ!
  break if valid?(pass)
end

puts pass # Pt 2
