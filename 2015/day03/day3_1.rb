grid = {}
x = [0,0]
y = [0,0]

count = 0
grid["#{x[0]},#{y[0]}"] = 'x'
File.open('input.txt').each do |line|
  line.each_char do |c|
    case c
    when '^'
      y[count % 2] += 1
    when 'v'
      y[count % 2] -= 1
    when '>'
      x[count % 2] += 1
    when '<'
      x[count % 2] -= 1
    end
    grid["#{x[count % 2]},#{y[count % 2]}"] = 'x'
    count += 1
  end
end
print "#{grid.size},#{count}\n"
