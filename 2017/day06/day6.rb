f = File.open('input.txt')
line = f.readlines[0]
f.close
memory = line.chomp.split(/\W/)
memory.map!{|c| c.to_i}
states = Array.new()
cycles=0
state = memory.join('|')
while(!states.include?(state)) do
  states.push(state)
  count = memory.max
  max_cell = memory.index(count)
  memory[max_cell] = 0
  cell = (max_cell + 1) % 16
  while(count > 0) do
      memory[cell] += 1
      count -= 1
      cell = (cell + 1) % 16
  end
  state = memory.join('|')
  cycles += 1
end
print "Cycles until loop:#{cycles}\n"
# part 2
cycles = 0
saved_state = state
state = ""
while(state != saved_state) do
  count = memory.max
  max_cell = memory.index(count)
  memory[max_cell] = 0
  cell = (max_cell + 1) % 16
  while(count > 0) do
      memory[cell] += 1
      count -= 1
      cell = (cell + 1) % 16
  end
  state = memory.join('|')
  cycles += 1
end
print "Loop size:#{cycles}\n"
