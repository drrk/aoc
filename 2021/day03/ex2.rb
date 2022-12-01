values1 = Array.new
values2 = Array.new

File.open('input.txt').each do |line|
    values1 << line.to_i(2)
    values2 << line.to_i(2)
end

(0..11).reverse_each do |i|
    ones = 0
    zeros = 0
    values1.each do |value|
        if (value & (1 << i)) >> i == 1 
            ones += 1
        else
            zeros +=1
        end
    end
    if ones >= zeros
        values1.keep_if {|value| (value & (1 << i)) >> i == 1}
    else
        values1.keep_if {|value| (value & (1 << i)) >> i == 0}
    end
    
    print "#{i}: #{values1.length}\n"
    if values1.length == 1
        break
    end
end
o2 = values1[0]

(0..11).reverse_each do |i|
    ones = 0
    zeros = 0
    values2.each do |value|
        if (value & (1 << i)) >> i == 1 
            ones += 1
        else
            zeros +=1
        end
    end
    if ones < zeros
        values2.keep_if {|value| (value & (1 << i)) >> i == 1}
    else
        values2.keep_if {|value| (value & (1 << i)) >> i == 0}
    end

    print "#{i}: #{values2.length}\n"
    if values2.length == 1
        break
    end
end
co2 = values2[0]

life = o2 * co2
print "#{life}\n"