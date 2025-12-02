tape = 50
count = 0
count2 = 0
# Parse Input
File.open('input.txt').each do |line|
    line.chomp
    match=/([LR])(\d+)/.match(line)
    dir = match[1]=='L'?-1:1
    move = match[2].to_i
    last_pos = tape
    tape = tape += move * dir
    rounds = move.div(100) # count total complete rotations
    tape = tape % 100
    count += 1 if tape == 0 
    count2 += rounds
    # Calc incomplete rotation that passed 0 
    unless last_pos == 0 # if last pos was 0, then only a complete rotation would count
        if tape == 0 # Landed on 0
	    count2 +=1
        elsif dir == 1 
     	    count2 +=1 if last_pos > tape # Passed 0 forward
        elsif dir == -1
            count2 +=1 if last_pos < tape # Passed 0 backward
	end
    end
end

print "Password (Part 1) #{count}\n\n"
print "Password (Part 2) #{count2}\n\n"

