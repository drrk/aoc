x=1
y=1
pad = [[1,4,7],[2,5,8],[3,6,9]]
File.open('day2_input').each do |line|
  line.each_char do |c|
    case c
    when 'U'
      y -= 1 unless y == 0
    when 'L'
      x -= 1 unless x == 0
    when 'D'
      y += 1 unless y == 2
    when 'R'
      x += 1 unless x == 2
    end
  end
  print "#{pad[x][y]}"
end
print "\n"