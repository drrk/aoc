f = File.open('day1_input.txt')
line = f.readlines[0]
f.close
dir = 0; # 0=N,1=E,2=S,3=W
x = 0
y = 0
prev = {}
finish = false
line.chomp.split(', ').each do |val|
  if val[0] == 'R'
    dir += 1
  else
    dir -= 1
  end
  dir = dir % 4
  distance = val.sub(/[RL]/, '').to_i
  distance.times do
    case dir
    when 0
      y += 1
    when 1
      x += 1
    when 2
      y -= 1
    when 3
      x -= 1
    end
    if prev.key?(x) && prev[x][y] == true
      print "Location #{x},#{y}\n"
      finish = true
      break
    end
    prev[x] = {} unless prev.key?(x)

    prev[x][y] = true
  end
  break if finish
end

total_distance = x.abs + y.abs
print "Distance #{total_distance}\n"
