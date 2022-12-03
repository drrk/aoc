sum = 0

f = File.open('input.txt')
while !f.eof? do
    line1 = f.readline.chomp.split('').uniq.join
    line2 = f.readline.chomp.split('').uniq.join
    line3 = f.readline.chomp.split('').uniq.join

    r = Regexp.new("[#{line1}]")
    # This is a little different to the first part, as multiple matches are return, and we need them all, hence scan and join
    r1 = Regexp.new("[#{line2.scan(r).join}]") 
    badge = line3[r1]
    priority = badge.ord
    if priority > 96
        priority -= 96
    else
        priority -= 64
        priority += 26
    end
    sum += priority
end

print "#{sum}\n"
