count = 0
File.open('input.txt').each do |line|
    line.chomp!
    ranges = line.split(',')
    r1 = ranges[0].split('-').map {|x| x.to_i }
    r2 = ranges[1].split('-').map {|x| x.to_i }
    
    rng1 = Range.new(r1[0],r1[1])
    rng2 = Range.new(r2[0],r2[1])

    if (rng1.include?(rng2.begin) || rng1.include?(rng2.last) || rng2.include?(rng1.begin) || rng2.include?(rng1.last))
        count +=1
    end
end

print "#{count}\n"
