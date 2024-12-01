list1 = Array.new
list2 = Array.new

distances = 0
simalaritys = 0

# Pull input into two arrays
File.open('input.txt').each do |line|
    line.chomp
    match=/(\d+)\s+(\d+)/.match(line)
    list1.push(match[1].to_i)
    list2.push(match[2].to_i)
end
# Sort in place
list1.sort!
list2.sort!

# Loop List 1 to calculate both answers
list1.each_index do |i|    
    distances += (list2[i] - list1[i]).abs
    simalaritys += list1[i] * list2.count(list1[i])
end

print "Distance (Part 1): #{distances}\nSimalarity (Part 2): #{simalaritys}\n\n"

