mem = Hash.new
high=0
File.readlines('input.txt').each do |line|
  s_line = line.split
  reg = s_line[0]
  test = s_line[5]
  test_reg = s_line[4]
  val = s_line[2]
  test_val = s_line[6]
  
  mem[test_reg] = 0 unless mem.include?(test_reg) 
  mem[reg] = 0 unless mem.include?(reg)
  
  if mem[test_reg].send(test.to_sym,test_val.to_i)   
    if s_line[1] == 'inc'
      mem[reg] += val.to_i
    else 
      mem[reg] -= val.to_i
    end
  end
  high = mem[reg] if mem[reg] > high
end

print high
print "\n"
