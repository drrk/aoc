count = 0
hx=0
hy=0
tx=0
ty=0
positions = {}
positions["#{tx},#{ty}"] = 1
File.open('input.txt').each do |line|
    line.chomp
    dir,steps = line.split
    for i in 1..steps.to_i do
        # Move Head
        case dir
        when 'U'
            hy += 1
        when 'D'
            hy -= 1
        when 'L'
            hx -= 1
        when 'R'
            hx += 1
        end
        # Check and Move Tail
        if (hx == tx)
            if (hy - ty == 2)
                # Head is two steps above of tail
                ty += 1
            elsif (hy - ty == -2)
                # Head is two steps below of tail
                ty -= 1
            end
        elsif (hy == ty)
            if (hx - tx == 2)
                # Head is two steps right of tail
                tx += 1
            elsif (hx - tx == -2)
                # Head is two steps left of tail
                tx -= 1
            end
        else
            # Both row and column differ
            if (hx - tx).abs == 1 && (hy - ty).abs == 1
                # Diagonally touching, tail doesn't move
            else
                if (hx > tx)
                    # Right
                    tx += 1
                else
                    # Left
                    tx -= 1
                end
                if (hy > ty)
                    # Up
                    ty += 1
                else
                    # Down
                    ty -= 1
                end
            end
        end
        # Save tail Position
        positions["#{tx},#{ty}"] = 1
    end
end

print "#{positions.size}\n"
