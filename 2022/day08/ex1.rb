rows = []
columns = []
r = 0
count = 0
File.open('input.txt').each do |line|
    line.chomp!
    rows[r] = line.split('')
    r += 1
end
columns = rows.transpose

for r in 1..(rows.size-2) do
    for c in 1..(columns.size-2) do
        # for each cell, we split the row and column, not including the active cell,
        # and if there is a smaller number in one of the remaing arrays, it counts as visable
        val = rows[r][c]
        if (
            (columns[c].slice(0,r).max < val) ||
            (columns[c].slice(r+1..rows.size).max < val) ||
            (rows[r].slice(0,c).max < val) ||
            (rows[r].slice(c+1..columns.size).max < val)
            )
            count += 1
        end
    end
end
# Add edge trees, all are visable
count = count + rows.size * 2
count = count + (columns.size-2) * 2
print "#{count}\n"

