totals = Array.new(12,0)
count = 0
File.open('input.txt').each do |line|
    value = line.to_i(2)
    (0..11).each do |i|
        v = (value & (1 << i)) >> i
        totals[11-i] += v
    end    
    count += 1
end
gamma = 0
(0..11).each do |i|
    gamma = gamma + ((totals[i] > 500?1:0) << (11-i))
end
epsilon = (~gamma) & 0xfff
power = epsilon * gamma
print "#{power}\n"