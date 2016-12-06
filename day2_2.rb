x = 2
y = 0

pad = [%w(x x 1 x x),
       %w(x 2 3 4 x),
       %w(5 6 7 8 9),
       %w(x A B C x),
       %w(x x D x x)]

File.open('day2_input.txt').each do |line|
  line.each_char do |c|
    case c
    when 'U'
      x -= 1 unless x == 0 || pad[x - 1][y] == 'x'
    when 'L'
      y -= 1 unless y == 0 || pad[x][y - 1] == 'x'
    when 'D'
      x += 1 unless x == 4 || pad[x + 1][y] == 'x'
    when 'R'
      y += 1 unless y == 4 || pad[x][y + 1] == 'x'
    end
  end
  print pad[x][y]
end
print "\n"
