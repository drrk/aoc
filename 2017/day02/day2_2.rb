sum=0
File.open('input.txt').each_with_index do |line,j|
  s_line=line.split(/\W/).sort_by { |a| a.to_i }.reverse
  n_line = s_line.map { |i| i.to_i }
  n_line.each do |item|
    answer=n_line.select { |i| i != item && item % i == 0 }
    if answer.size == 1
      sum += item / answer[0]
      break
    end
  end
end
print "#{sum}\n"
