sum=0
File.open('input.txt').each do |line|
  s_line=line.split(/\W/).sort_by { |a| a.to_i }
  sum += (s_line[-1].to_i - s_line[0].to_i)
end
print "#{sum}\n"
