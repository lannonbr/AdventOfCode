# Day 6 of Advent of Code

arr = falses(1000, 1000)
arr_2 = zeros(1000, 1000)

# Julia does indexing starting at 1

function toggle(x1, y1, x2, y2)
	for x in x1:x2
		for y in y1:y2
			if arr[x,y] == true
				arr[x,y] = false
			else
				arr[x,y] = true
			end
			arr_2[x,y] += 2
		end
	end
end

function set(to, x1, y1, x2, y2)
	for x in x1:x2
		for y in y1:y2
			arr[x,y] = to
			if to == true
				arr_2[x,y] += 1
			else
				if !(arr_2[x,y] == 0)
					arr_2[x,y] -= 1
				end
			end
		end
	end
end

f = open("lights.dat")

lines = readlines(f)

close(f)

regex = r".(u|o)([a-z ]*)(\d*),(\d*) through (\d*),(\d*)"
regex_turn = r"(on|off)"

for line in lines
	a = match(regex, line)
	cap = a.captures

	x1 = int(cap[3]) + 1
	y1 = int(cap[4]) + 1
	x2 = int(cap[5]) + 1
	y2 = int(cap[6]) + 1

	if cap[1] == "u"
		onoff = match(regex_turn, cap[2])
		if onoff.captures[1] == "on"
			println("On: ($x1, $y1), ($x2, $y2)")
			set(true, x1, y1, x2, y2)
		else
			println("Off: ($x1, $y1), ($x2, $y2)")
			set(false, x1, y1, x2, y2)
		end
	else
		println("Toggle: ($x1, $y1), ($x2, $y2)")
		toggle(x1, y1, x2, y2)
	end
end

println(sum(arr))
println(BigInt(sum(arr_2)))
