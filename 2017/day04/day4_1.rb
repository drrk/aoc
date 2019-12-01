count=0
File.open('input.txt').each do |line|
  s_line=line.split(/\W/)
  count = count + 1 if s_line.size == s_line.uniq.size
end
print "#{count}\n"
