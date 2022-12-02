score = 0
points = {
    "AX" => 4, #1 + 3
    "AY" => 8, #2 + 6
    "AZ" => 3, #3 + 0
    "BX" => 1, #1 + 0
    "BY" => 5, #2 + 3
    "BZ" => 9, #3 + 6
    "CX" => 7, #1 + 6
    "CY" => 2, #2 + 0
    "CZ" => 6, #3 + 3
}
File.open('input.txt').each do |line|
    game = line.gsub(/[^ABCXYZ]/,'')
    score += points[game]
end

print "#{score}\n"
