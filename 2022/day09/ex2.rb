def move(lx,ly,fx,fy)
    if (lx == fx)
        if (ly - fy == 2)
            # Leader is two steps above of follower
            fy += 1
        elsif (ly - fy == -2)
            # Leader is two steps below of follower
            fy -= 1
        end
    elsif (ly == fy)
        if (lx - fx == 2)
            # Leader is two steps right of follower
            fx += 1
        elsif (lx - fx == -2)
            # Leader is two steps left of follower
            fx -= 1
        end
    else
        # Both row and column differ
        if (lx - fx).abs == 1 && (ly - fy).abs == 1
            # Diagonally touching, follower doesn't move
        else
            if (lx > fx)
                # Right
                fx += 1
            else
                # Left
                fx -= 1
            end
            if (ly > fy)
                # Up
                fy += 1
            else
                # Down
                fy -= 1
            end
        end
    end
    return [fx,fy]
end

count = 0
positions = {}
body = [
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
    {:x => 0, :y => 0},
]
positions["#{body[9][:x]},#{body[9][:y]}"] = 1
File.open('input.txt').each do |line|
    line.chomp
    dir,steps = line.split
    for i in 1..steps.to_i do
        # Move Head
        case dir
        when 'U'
            body[0][:y] += 1
        when 'D'
            body[0][:y] -= 1
        when 'L'
            body[0][:x] -= 1
        when 'R'
            body[0][:x] += 1
        end
        for j in 1..9 do
            body[j][:x],body[j][:y] = move(body[j-1][:x],body[j-1][:y],body[j][:x],body[j][:y])
        end
        # Save tail Position
        positions["#{body[9][:x]},#{body[9][:y]}"] = 1
    end
end

print "#{positions.size}\n"
