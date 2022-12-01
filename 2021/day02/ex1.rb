x = 0
z = 0
File.open('input.txt').each do |line|
    parts = line.split
    distance = parts[1].to_i
    case parts[0]
    when "up"
        z -= distance
        if z < 0 then
            z = 0
        end
    when "down"
        z += distance
    when "forward"
        x += distance
    end
end
print x*z