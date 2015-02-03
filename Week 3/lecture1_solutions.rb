# Open the file called cards.txt and save it to the variable f
f = File.open("cards.txt")

# Create a new file called output.txt and save it to the variable new_file
new_file = File.open("output.txt", "w")

# This is a hash that maps the card value as a string to its integer value
h = {"A" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 11, "Q" => 12, "K" => 13}

# Here we iterate through the lines of the file
f.each do |line|
  # Here we split the line into a list of cards
  hand = line.split(" ")

  # Initialize our accumulator variable to 0
  sum = 0

  # Iterate through the cards and add them to the sum variable
  hand.each do |card|
    sum += h[card]
  end

  # At this point, sum holds the total value of the 5 cards for this line of the file

  # Here we print the sum to our output file
  new_file.puts sum
end
