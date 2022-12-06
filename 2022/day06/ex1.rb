data = File.open('input.txt').readline.chomp
for i in 0..data.length-4 do
    if (data.slice(i,4).split('').uniq.length == 4)
        print "#{i+4}\n"
        exit 0
    end
end

