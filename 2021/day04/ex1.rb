def search(grids, numbers)
    numbers.each do |n|
        grids.each do |grid| 
            if (i = grid.flatten.index(n))
                grid[i / 5][i % 5] =-1
            end
        end
        grids.each do |grid|
            (0..4).each do |row|
                if (grid[row].count(-1) == 5) || (grid.transpose[row].count(-1) == 5)
                    print "found\n"
                    return grid, n
                end
            end
        end
    end
end

grids = Array.new

input = File.open('input.txt')
numbers = input.readline.chomp.split(/,/).map {|n| n.to_i}

while line = input.gets do
    grid = Array.new
    (1..5).each do
        grid << input.readline.chomp.split.map {|n| n.to_i}
    end
    grids << grid
end


grid, number = search(grids, numbers)
sum = 0
grid.flatten.each do |n|
    if n != -1
        sum += n
    end
end

print "#{number * sum}\n"


