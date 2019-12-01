f = File.open('input.txt')
line = f.readlines[0]
f.close
chars = line.chomp.split('')
sum=0
length = chars.length
skip=length/2
chars.each_with_index do |val,i|
next_i = (i + skip) % length
next_val = chars[next_i].to_i
sum += next_val if next_val == val.to_i
end
print "#{sum}\n"
