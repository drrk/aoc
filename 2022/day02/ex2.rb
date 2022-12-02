score = 0
points = {
    #Rock (1)
    "AX" => 3, # Lose, Scissors, 0 + 3
    "AY" => 4, # Draw, Rock, 3 + 1
    "AZ" => 8, # Win, Paper  6 + 2
    #Paper (2)
    "BX" => 1, # Lose, Rock, 0 + 1
    "BY" => 5, # Draw, Paper, 3 + 2
    "BZ" => 9, # Win, Sciccors  6 + 3
    #Scissors (3)
    "CX" => 2, # Lose, Paper, 0 + 2
    "CY" => 6, # Draw, Scissors, 3 + 3
    "CZ" => 7, # Win, Rock  6 + 1
}
File.open('input.txt').each do |line|
    game = line.gsub(/[^ABCXYZ]/,'')
    score += points[game]
end

print "#{score}\n"
