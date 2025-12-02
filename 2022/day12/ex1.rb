def find(grid, target)
    grid.each_index do |row|
        if grid[row].include?(target)
            y = row
            x = grid[row].index(target)
            return {:x => x, :y => y}
        end
    end
end

def valid_elevation(current, target)
    if current == 'z' && target == 'E'
        return true
    elsif current == 'S' && (target == 'a' || target == 'b')
        return true
    elsif target < current
        return true
    elsif target.ord - current.ord == 1
        return true
    elsif target == current
        return true
    end
    return false
end

def valid_dir(grid, pos)
    valid = []
    x = pos[:x]
    y = pos[:y]
    current_elevation = grid[y][x]

    if x < grid[0].size && valid_elevation(current_elevation, grid[y][x + 1])
        valid.push(:E)
    end
    if x > 0 && valid_elevation(current_elevation, grid[y][x - 1])
        valid.push(:W)
    end    
    if y < grid.size && valid_elevation(current_elevation, grid[y + 1][x])
        valid.push(:S)
    end
    if y > 0 && valid_elevation(current_elevation, grid[y - 1][x])
        valid.push(:N)
    end
    return valid
end
class MapNode
    def initialize(height)
        @height = height
        @weight = Float::INFINITY    
    end
    def height
        return @height
    end
    def getWeight
        return @weight
    end
    def setWeight(weight)
        @weight = weight
    end
    def to_s
        return @height
    end
    def ==(other)
        return @weight==other
    end
end

map = Array.new
row = 0
File.open('input.txt').each do |line|
    line.chomp
    col = 0
    map[row] = Array.new
    line.each_char do |height|
        map[row][col] = MapNode.new(height)
        col += 1
    end
    row += 1
end
print map[0]
# find start and end
current_pos = find(map, 'S')
target_pos = find(map, 'E')
steps = 0

while current_pos != target_pos do
    route_options = valid_dir(map, current_pos)
    dir = nil
    print "#{route_options} found "
    if route_options.size > 1
        # Find distance to target to help choose prefered direction
        x_to_go = target_pos[:x] - current_pos[:x]
        y_to_go = target_pos[:y] - current_pos[:y]
        prefered_routes = []
        if x_to_go.abs > y_to_go.abs
            # Further X than Y
            if x_to_go > 0
                # East is best
                prefered_routes.push(:E)
                if y_to_go > 0
                    # Next North
                    prefered_routes.push(:N)
                    # Then South, as it puts us less out of the way then W (started closer)
                    prefered_routes.push(:S)
                    prefered_routes.push(:W)
                else
                    # Next South
                    prefered_routes.push(:S)
                    # Then North, as it puts us less out of the way then W (started closer)
                    prefered_routes.push(:N)
                    prefered_routes.push(:W)
                end
            else
                # West is best
                prefered_routes.push(:W)
                if y_to_go > 0
                    # Next North
                    prefered_routes.push(:N)
                    # Then South, as it puts us less out of the way then E (started closer)
                    prefered_routes.push(:S)
                    prefered_routes.push(:E)
                else
                    # Next South
                    prefered_routes.push(:S)
                    # Then North, as it puts us less out of the way then E (started closer)
                    prefered_routes.push(:N)
                    prefered_routes.push(:E)
                end
            end
        else
            if y_to_go > 0
                # North is best
                prefered_routes.push(:N)
                if x_to_go > 0
                    # Next East
                    prefered_routes.push(:E)
                    # Then West, as it puts us less out of the way then S (started closer)
                    prefered_routes.push(:W)
                    prefered_routes.push(:S)
                else
                    # Next West
                    prefered_routes.push(:W)
                    # Then East, as it puts us less out of the way then S (started closer)
                    prefered_routes.push(:E)
                    prefered_routes.push(:S)
                end
            else
                # South is best
                prefered_routes.push(:S)
                if x_to_go > 0
                    # Next East
                    prefered_routes.push(:E)
                    # Then West, as it puts us less out of the way then N (started closer)
                    prefered_routes.push(:W)
                    prefered_routes.push(:N)
                else
                    # Next West
                    prefered_routes.push(:W)
                    # Then East, as it puts us less out of the way then N (started closer)
                    prefered_routes.push(:E)
                    prefered_routes.push(:N)
                end
            end
        end
        for route in prefered_routes
            if route_options.include?(route)
                dir = route
                break
            end
        end
    else
        dir = route_options[0]
    end
   
    print "#{dir} => "
    case dir
    when :N
        current_pos[:y] += 1
    when :S
        current_pos[:y] -= 1
    when :E
        current_pos[:x] += 1
    when :W
        current_pos[:x] -= 1
    end
    print "#{current_pos}\n"
    steps += 1
end