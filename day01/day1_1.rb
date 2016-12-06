f = File.open('day1_input.txt')
line = f.readlines[0]
f.close
dir = 0; # 0=N,1=E,2=S,3=W
x = 0
y = 0
line.chomp.split(', ').each do |val|
  if val[0] == 'R'
    dir += 1
  else
    dir -= 1
  end
  dir = dir % 4
  case dir
  when 0
    y -= val.sub(/[RL]/, '').to_i
  when 1
    x += val.sub(/[RL]/, '').to_i
  when 2
    y += val.sub(/[RL]/, '').to_i
  when 3
    x -= val.sub(/[RL]/, '').to_i
  end
end
answer = x.abs + y.abs
print "#{answer}\n"
