topelf = 0
currentelf = 0
File.open('input.txt').each do |line|
    if line == "\n"
        # New Elf
        if currentelf > topelf
            topelf = currentelf
        end
        currentelf = 0
    else
        value = line.to_i
        currentelf = currentelf + value
    end
end

print "#{topelf}\n"
