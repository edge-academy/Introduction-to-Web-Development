f = File.open("input.txt")

lines = f.readlines

words_lists = lines.map {|line| line.split(" ")}

words = words_lists.flatten

# This is a clever way of creating an empty hash where the default
# value is 0 when you look up a value that doesn't exist in the hash
h = Hash.new(0)

words.each do |word|
  # Increase the frequency by 1
  h[word] += 1
end

sorted_freqs h.sort {|a,b| a[1] <=> b[1]}.reverse

# To print the top ten most frequent words
puts sorted_freqs[0..10]
