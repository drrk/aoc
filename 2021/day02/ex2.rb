x = 0
z = 0
aim = 0
File.open('input.txt').each do |line|
    parts = line.split
    distance = parts[1].to_i
    case parts[0]
    when "up"
        aim -= distance
    when "down"
        aim += distance
    when "forward"
        x += distance
        z += aim * distance
    end
end
print x*z