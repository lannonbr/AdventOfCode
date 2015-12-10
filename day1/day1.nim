var inFile = open("elevator.dat")

var
    floor = 0
    pos = 1

for line in inFile.lines:
    for c in line:
        if c == '(':
            floor += 1
        else:
            floor -= 1
        if floor == -1:
            echo("On floor -1. Pos: ", $pos)
        pos += 1

echo("Final Floor: ", $floor)
