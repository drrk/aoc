lights = Array.new(1000) {Array.new(1000,0)}

matcher = /([ a-z]+)(\d+),(\d+)[ a-z]+(\d+),(\d+)/

File.open('input.txt').each do |line|
    matches = matcher.match(line)
    x1,y1 = matches[2..3].map {|c| c.to_i }
    x2,y2 = matches[4..5].map {|c| c.to_i }
    case matches[1]
    when "toggle "
        (x1..x2).each do |x|
            (y1..y2).each do |y|
                lights[x][y] += 2
            end
        end
    when "turn on "
        (x1..x2).each do |x|
            (y1..y2).each do |y|
                lights[x][y] += 1
            end
        end  
    when "turn off "
        (x1..x2).each do |x|
            (y1..y2).each do |y|
                lights[x][y] -= 1
                if lights[x][y] < 0
                    lights[x][y] = 0
                end
            end
        end   
    end      
end

sum = 0
(0..999).each do |x|
    (0..999).each do |y|
        sum += lights[x][y] 
    end
end

print "#{sum}\n"