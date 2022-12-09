rows = []
columns = []
r = 0
bestview = 0
File.open('input.txt').each do |line|
    line.chomp!
    rows[r] = line.split('').map {|i| i.to_i}
    r += 1
end
columns = rows.transpose

for r in 1..(rows.size-2) do
    for c in 1..(columns.size-2) do
        # for each cell, we split the row and column, not including the active cell,
        # and calculate viewing distance
        val = rows[r][c]

        up = columns[c].slice(0,r)
        down = columns[c].slice(r+1..rows.size)
        left = rows[r].slice(0,c)
        right = rows[r].slice(c+1..columns.size)
        up.reverse!
        left.reverse!

        upscore = up.take_while {|i| i < val}.size
        downscore = down.take_while {|i| i < val}.size
        leftscore = left.take_while {|i| i < val}.size
        rightscore = right.take_while {|i| i < val}.size

        # This is ugly, but it's 34 minutes past midnight and I just was to solve it.
        # take_while doesn't include the match, so if it wasn't the end of the array,
        # we need to add it back to the count.
        if upscore != up.size
            upscore += 1
        end
        if downscore != down.size
            downscore += 1
        end
        if leftscore != left.size
            leftscore += 1
        end
        if rightscore != right.size
            rightscore += 1
        end

        score = upscore * downscore * leftscore * rightscore

        if score > bestview
            bestview = score
        end
    end
end

print "#{bestview}\n"

