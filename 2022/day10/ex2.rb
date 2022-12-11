sum = 0
clock = 0
x = 1
instr_counter = 0
instr = ''
operand = 0
f = File.open('input.txt')

while clock < 240
    clock += 1
    pos = (clock -1 ) % 40
    if pos == 0
        print "\n"
    end
    if pos == (x-1) || pos == x || pos == (x+1)
        print "#"
    else 
        print "."
    end

    if instr == ''
        line = f.readline.chomp
        instr,operand = line.split
    end

    case instr
    when 'noop'
        instr = ''
    when 'addx'
        if instr_counter == 0
            instr_counter = 1
        else
            instr_counter = 0
            x += operand.to_i
            instr = ''
        end
    end
end
print "\n"