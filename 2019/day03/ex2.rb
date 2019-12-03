f = File.open('input.txt')
wire1 = f.readline
wire2 = f.readline
f.close

x = 0
y = 0
grid = {}
distance = 999999999999999 # Big number
travel = 0
wire1.chomp.split(',').each do |val|
  dir = val[0]
  length = val.sub(/[RLUD]/, '').to_i
  case dir
  when 'R'
    (1..length).each do
      x += 1
      travel += 1
      grid["#{x},#{y}"] = travel
    end
  when 'L'
    (1..length).each do
      x -= 1
      travel += 1
      grid["#{x},#{y}"] = travel
    end
  when 'U'
    (1..length).each do
      y += 1
      travel += 1
      grid["#{x},#{y}"] = travel
    end
  when 'D'
    (1..length).each do
      y -= 1
      travel += 1
      grid["#{x},#{y}"] = travel
    end
  end
end

x = 0
y = 0
travel = 0
wire2.chomp.split(',').each do |val|
  dir = val[0]
  length = val.sub(/[RLUD]/, '').to_i
  case dir
  when 'R'
    (1..length).each do
      x += 1
      travel += 1
      if grid["#{x},#{y}"]
        if grid["#{x},#{y}"] + travel < distance
          distance = grid["#{x},#{y}"] + travel
        end
      end
    end
  when 'L'
    (1..length).each do
      x -= 1
      travel += 1
      if grid["#{x},#{y}"]
        if grid["#{x},#{y}"] + travel < distance
          distance = grid["#{x},#{y}"] + travel
        end
      end
    end
  when 'U'
    (1..length).each do
      y += 1
      travel += 1
      if grid["#{x},#{y}"]
        if grid["#{x},#{y}"] + travel < distance
          distance = grid["#{x},#{y}"] + travel
        end
      end
    end
  when 'D'
    (1..length).each do
      y -= 1
      travel += 1
      if grid["#{x},#{y}"]
        if grid["#{x},#{y}"] + travel < distance
          distance = grid["#{x},#{y}"] + travel
        end
      end
    end
  end
end

puts "Distance: #{distance}"
