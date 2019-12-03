f = File.open('input.txt')
wire1 = f.readline
wire2 = f.readline
f.close

x = 0
y = 0
grid = {}
distance = 999999999999999 # Big number
wire1.chomp.split(',').each do |val|
  dir = val[0]
  length = val.sub(/[RLUD]/, '').to_i
  case dir
  when 'R'
    (1..length).each do
      x += 1
      grid["#{x},#{y}"] = 'x'
    end
  when 'L'
    (1..length).each do
      x -= 1
      grid["#{x},#{y}"] = 'x'
    end
  when 'U'
    (1..length).each do
      y += 1
      grid["#{x},#{y}"] = 'x'
    end
  when 'D'
    (1..length).each do
      y -= 1
      grid["#{x},#{y}"] = 'x'
    end
  end
end

x = 0
y = 0
wire2.chomp.split(',').each do |val|
  dir = val[0]
  length = val.sub(/[RLUD]/, '').to_i
  case dir
  when 'R'
    (1..length).each do
      x += 1
      if grid["#{x},#{y}"] == 'x'
        if x.abs + y.abs < distance
          distance = x.abs + y.abs
        end
      end
    end
  when 'L'
    (1..length).each do
      x -= 1
      if grid["#{x},#{y}"] == 'x'
        if x.abs + y.abs < distance
          distance = x.abs + y.abs
        end
      end
    end
  when 'U'
    (1..length).each do
      y += 1
      if grid["#{x},#{y}"] == 'x'
        if x.abs + y.abs < distance
          distance = x.abs + y.abs
        end
      end
    end
  when 'D'
    (1..length).each do
      y -= 1
      if grid["#{x},#{y}"] == 'x'
        if x.abs + y.abs < distance
          distance = x.abs + y.abs
        end
      end
    end
  end
end

puts "Distance: #{distance}"
