data = "R3, L2, L2, R4, L1, R2, R3, R4, L2, R4, L2, L5, L1, R5, R2, R2, L1, R4, R1, L5, L3, R4, R3, R1, L1, L5, L4, L2, R5, L3, L4, R3, R1, L3, R1, L3, R3, L4, R2, R5, L190, R2, L3, R47, R4, L3, R78, L1, R3, R190, R4, L3, R4, R2, R5, R3, R4, R3, L1, L4, R3, L4, R1, L4, L5, R3, L3, L4, R1, R2, L4, L3, R3, R3, L2, L5, R1, L4, L1, R5, L5, R1, R5, L4, R2, L2, R1, L5, L4, R4, R4, R3, R2, R3, L1, R4, R5, L2, L5, L4, L1, R4, L4, R4, L4, R1, R5, L1, R1, L5, R5, R1, R1, L3, L1, R4, L1, L4, L4, L3, R1, R4, R1, R1, R2, L5, L2, R4, L1, R3, L5, L2, R5, L4, R5, L5, R3, R4, L3, L3, L2, R2, L5, L5, R3, R4, R3, R4, R3, R1"
dir = 0; # 0=N,1=E,2=S,3=W
x = 0
y = 0
prev = {}
finish = false
data.split(', ').each do |val|
  if val[0] == 'R'
    dir += 1
  else
    dir -= 1
  end
  dir = dir % 4
  distance = val.sub(/[RL]/,'').to_i
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
    if !prev.key?(x) 
      prev[x] = {}
    end
    prev[x][y] = true
  end
  if finish
    break
  end
end

total_distance = x.abs + y.abs
print "Distance #{total_distance}\n"

