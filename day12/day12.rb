File.open('json.dat', 'r') { |f| puts f.readline.scan(/-?[0-9]+/).map{|str| str.to_i }.inject(0, &:+) }
