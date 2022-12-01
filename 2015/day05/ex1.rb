m1 = /[aeiou].*[aeiou].*[aeiou]/
m2 = /([a-z])\1/
m3 = /(ab|cd|pq|xy)/

count = 0
File.open('input.txt').each do |line|
    if line =~ m1 && line =~ m2 && !(line =~ m3) 
        count += 1
    end
end
print "#{count}\n"