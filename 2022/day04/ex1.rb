count = 0
File.open('input.txt').each do |line|
    line.chomp!
    ranges = line.split(',')
    r1 = ranges[0].split('-').map {|x| x.to_i }
    r2 = ranges[1].split('-').map {|x| x.to_i }
    
    # first check if identical
    if (r1[0] == r2[0] && r1[1] == r2[1])
        count += 1
    else
        # not identical find smaller
        if ((r1[1]-r1[0]) > (r2[1] - r2[0]))
            # r1 larger
            if ((r1[0] <= r2[0]) && (r1[1] >= r2[1]))
                count += 1
            end
        else
            # r2 larger
            if ((r2[0] <= r1[0]) && (r2[1] >= r1[1]))
                count += 1
            end
        end
    end
end

print "#{count}\n"
