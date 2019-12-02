result = 0
noun = -1
verb = 99
while result != 19690720
  verb += 1
  if verb > 99
    verb = 0
    noun += 1
  end
  pc = 0
  mem = File.open('input.txt').readlines[0].chomp.split(',').map{|a| a.to_i}
  opcode = mem[pc]
  mem[1] = noun
  mem[2] = verb
  while opcode != 99
    val1_loc = mem[pc + 1] || 0
    val2_loc = mem[pc + 2] || 0
    val1 = mem[val1_loc] || 0
    val2 = mem[val2_loc] || 0
    dest_loc = mem[pc + 3] || 0
    case opcode
    when 1
      mem[dest_loc] = val1 + val2
    when 2
      mem[dest_loc] = val1 * val2
    else
      puts "Error invalid opcode #{opcode} at position #{pc}\n"
      break
    end
    pc += 4
    opcode = mem[pc]
  end
  result = mem[0]
end
puts "Program finished, result: #{noun * 100 + verb}\n"
