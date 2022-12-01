topelf = 0
secondelf = 0
thirdelf = 0
currentelf = 0
File.open('input.txt').each do |line|
    if line == "\n"
        # New Elf
        if currentelf > topelf
            thirdelf = secondelf
            secondelf = topelf
            topelf = currentelf
        elsif currentelf > secondelf
            thirdelf = secondelf
            secondelf = currentelf
        elsif currentelf > thirdelf
            thirdelf = currentelf
        end
        currentelf = 0
    else
        value = line.to_i
        currentelf = currentelf + value
    end
end

print "#{topelf + secondelf + thirdelf}\n"
