data = "R3, L2, L2, R4, L1, R2, R3, R4, L2, R4, L2, L5, L1, R5, R2, R2, L1, R4, R1, L5, L3, R4, R3, R1, L1, L5, L4, L2, R5, L3, L4, R3, R1, L3, R1, L3, R3, L4, R2, R5, L190, R2, L3, R47, R4, L3, R78, L1, R3, R190, R4, L3, R4, R2, R5, R3, R4, R3, L1, L4, R3, L4, R1, L4, L5, R3, L3, L4, R1, R2, L4, L3, R3, R3, L2, L5, R1, L4, L1, R5, L5, R1, R5, L4, R2, L2, R1, L5, L4, R4, R4, R3, R2, R3, L1, R4, R5, L2, L5, L4, L1, R4, L4, R4, L4, R1, R5, L1, R1, L5, R5, R1, R1, L3, L1, R4, L1, L4, L4, L3, R1, R4, R1, R1, R2, L5, L2, R4, L1, R3, L5, L2, R5, L4, R5, L5, R3, R4, L3, L3, L2, R2, L5, L5, R3, R4, R3, R4, R3, R1"
dir = 0; # 0=N,1=E,2=S,3=W
dE = 0
dS = 0
data.split(', ').each do |val|
  if val[0] == 'R'
    dir += 1
  else
    dir -= 1
  end
  dir = dir % 4
  case dir 
  when 0
      dS -= val.sub(/[RL]/,'').to_i
    when 1
      dE += val.sub(/[RL]/,'').to_i
    when 2
      dS += val.sub(/[RL]/,'').to_i
    when 3
      dE -= val.sub(/[RL]/,'').to_i
  end
end
answer = dE.abs + dS.abs
print "#{answer}\n"
