f = File.open('input.txt')
line = f.readlines[0]
f.close
chars = line.chomp.split('')
prev=chars[-1].to_i
sum=0
chars.each do |val|
sum += prev if prev == val.to_i
prev = val.to_i
end
print "#{sum}\n"
