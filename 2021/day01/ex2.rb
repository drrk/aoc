count = 0
last = -1
numbers = Array.new
File.open('input.txt').each do |line|
    numbers << line.to_i
end

(0..numbers.size-3).each do |i|
    current = numbers[i] + numbers[i + 1] + numbers[i + 2]
    if current > last then
        unless last == -1 then
            count = count + 1
        end
    end
    last = current
end
print "#{count}\n"
