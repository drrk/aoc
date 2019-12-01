count=0
File.open('input.txt').each do |line|
  s_line=line.split(/\W/)
  if s_line.size == s_line.uniq.size
    foo=s_line.map{|word| word.chars.sort.join}
    count = count + 1 if foo.size == foo.uniq.size
  end
end
print "#{count}\n"
