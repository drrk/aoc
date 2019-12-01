sum = 0
File.open('input.txt').each do |line|
  s_line = line.split(/x/)
  areas = [(s_line[0].to_i * s_line[1].to_i * 2), (s_line[0].to_i * s_line[2].to_i * 2), (s_line[1].to_i * s_line[2].to_i * 2)].sort_by { |a| a.to_i }
  area = areas[0] + areas[1] + areas[2] + areas[0] / 2
  sum += area
end
print "#{sum}\n"