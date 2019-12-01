list = Array.new 

File.open('input.txt').each do |line|
  list.push(line.chomp.to_i)
end

index = 0
length = list.size
count = 0
while (index >= 0 && index < length) do
  step = list[index]
  list[index] +=1
  index += step
  count +=1
end
print count
print "\n"
