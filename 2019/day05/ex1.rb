pc = 0
mem = File.open('input.txt').readlines[0].chomp.split(',').map{|a| a.to_i}
opcode = mem[pc]
mem[1] = 12
mem[2] = 2
while opcode != 99
  val1 = mem[mem[pc + 1]]
  val2 = mem[mem[pc + 2]]
  case opcode
  when 1
    mem[mem[pc + 3]] = val1 + val2
  when 2
    mem[mem[pc + 3]] = val1 * val2
  else
    puts "Error invalid opcode #{opcode} at position #{pc}\n"
    break
  end
  pc += 4 
  opcode = mem[pc]
end
puts "Program finished, position 0: #{mem[0]}\n"
