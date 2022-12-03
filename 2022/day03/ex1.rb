sum = 0
File.open('input.txt').each do |line|
    line.chomp!
    half_length = line.size/2
    first = line[0,half_length]
    second = line[half_length,half_length]
    r = Regexp.new("[#{first}]") # Construct a regex of the first half as a character set
    duplicate = second[r] # find the charater in the second half that matches
    priority = duplicate.ord
    if priority > 96
        priority -= 96
    else
        priority -= 64
        priority += 26
    end
    sum += priority
end

print "#{sum}\n"
