sum = 0
sumConditional = 0
enabled = true
# Parse each line of imput
File.open('input.txt').each do |line|
    line.scan(/mul\(\d+\,\d+\)|do\(\)|don't\(\)/) do |instruction|
        if instruction == "do()"
            enabled = true
        elsif instruction == "don't()"
            enabled = false 
        else
            match = /mul\((\d+)\,(\d+)\)/.match(instruction)
            val = match[1].to_i * match[2].to_i
            sumConditional += val if enabled
            sum += val
        end
    end
end

print "Sum of valid mul instructions (part 1): #{sum}\nSum of enabled valid mul instructions (part 2): #{sumConditional}\n\n"

