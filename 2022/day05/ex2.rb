piles = [
    [],
    ['R','G','J','B','T','V','Z'],
    ['J','R','V','L'],
    ['S','Q','F'],
    ['Z','H','N','L','F','V','Q','G'],
    ['R','Q','T','J','C','S','M','W'],
    ['S','W','T','C','H','F'],
    ['D','Z','C','V','F','N','J'],
    ['L','G','Z','D','W','R','F','Q'],
    ['J','B','W','V','P']
]

File.open('input.txt').each do |line|
    line.chomp!
    if (line.start_with?('move'))
        data = line.match(/move (\d+) from (\d+) to (\d+)/)
        count = data[1].to_i
        src = data[2].to_i
        dest = data[3].to_i
        x = piles[src].pop(count)
        piles[dest].concat(x)
    end
end

for i in 1..9 do
    print(piles[i].pop)
end
print "\n" 