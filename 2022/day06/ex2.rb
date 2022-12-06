data = File.open('input.txt').readline.chomp
for i in 0..data.length-14 do
    if (data.slice(i,14).split('').uniq.length == 14)
        print "#{i+14}\n"
        exit 0
    end
end

