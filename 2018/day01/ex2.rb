sum = 0
input = []
File.open('input.txt').each do |line|
  input.push(line.chomp.to_i)
end
seen={}
freq = 0
row = 0
while (seen[freq] == nil) do
  seen[freq] = 1
  freq += input[row % input.length]
  row +=1
end 
print "#{freq}\n"
