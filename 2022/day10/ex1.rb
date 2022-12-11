sum = 0
clock = 0
check = 20
x = 1
instr_counter = 0
instr = ''
operand = 0
f = File.open('input.txt')

while clock < 220
    clock += 1
    if clock == check
        sum += (clock * x)
        check += 40
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

print "#{sum}\n"
