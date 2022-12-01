m1 = /([a-z][a-z]).*\1/
m2 = /([a-z]).\1/

count = 0
File.open('input.txt').each do |line|
    if line =~ m1 && line =~ m2
        count += 1
    end
end
print "#{count}\n"