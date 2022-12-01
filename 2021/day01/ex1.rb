count = 0
last = 999999999999999999999999999999
File.open('input.txt').each do |line|
    if line.to_i > last
        count = count + 1
    end
    last = line.to_i
end

print "#{count}\n"
