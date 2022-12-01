def call(grids, n)
    grids.each do |grid| 
        if (i = grid.flatten.index(n))
            grid[i / 5][i % 5] =-1
        end
    end
end

def search(grids,numbers)
    final_grid = nil
    numbers.each do |n|
        call(grids, n)
        grids.delete_if { |grid|
            found = false
            (0..4).each do |row|
                if (grid[row].count(-1) == 5) || (grid.transpose[row].count(-1) == 5)
                    found = true
                end
            end
            found
        }
        if grids.length == 1
            final_grid = grids[0]
        end 
        if grids.length == 0 
            return final_grid, n
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


