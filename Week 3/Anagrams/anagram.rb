# The filename is a variable assigned from the arguments we get from the command line
# ARGV is an array. When you are at the prompt in the commmand line, cd is an argument,
# and the directory you are going to is an argument, so in:
#
# ~> cd /Users/Gamal <--- cd = /Users/Gamal is an argument to cd.
#
# so ARGV[0] asks for the first argument on the line. When we run 'ruby anagrams.rb dict.txt'
# ARGV[0] is going to be dict.txt. if we ran 'ruby anagrams.rb dict.txt nodict.txt'
# ARGV[1] is going to be nodict.txt. Everything is indexed from 0.
filename = ARGV[0]

# just so we know that we got the right variable and so we know the program
# hasn't stopped, we print the name of the file to the console.
# the #{filename} says to evaluate the name of whatever is inside '#{}'
# in ths case #{filename} == ARGV[0]
# We do this because we are inside of a string. Otherwise we would have
# "Reading from file filename" and that's not what we want.
# the '\n' says to put a new line after.
puts "Reading from file #{filename}\n"

# here we are creating a new File object. File has a method that belongs to the
# class called 'open' that takes two arguments:
#
# the file name
# what we want to do with the file
#
# We are trying to create a new file and write stuff to it, so we are naming it
# 'anagrams.txt' and we specify that we want to write to it with 'w'
# 'w' will overwrite stuff in the file. If the file doesn't exist, we will create it.
anagramFile = File.open("anagrams.txt", "w")

# We are doing the same as above, except we are reading the value
wordFile = File.open(filename, "r")

# We are creating a dictionary really. Just like a regular dictionary you have in the library.
# You have a thing you want to lookup, and that thing has a definition. In Ruby,
# the word is a 'key'
# the definition is the 'value'
# Sometimes you might look up a word that isn't in a dictionary. the argument 'nil'
# tells Ruby:
#
# If you can't find this, don't blow up or terminate. Just return 'nil'
wordHash = Hash.new(nil)

# here we just want to know that the program is still working. It is good
# to provide feedback to the user while the program runs from the command line.
puts "Working!\n\n"

# So we want to read in the file. To do this, we read it line by line.
# the variable 'line' will be where we store every single line. It is
# being assigned the value wordFile.gets
# The 'gets' method returns the next line in the file.
# the 'while' keyword says:
#
# while we have a thing, run this block of code
#
# In this case 'thing' is a value that is either True or False. For us, it's while 'line'
# has a true value. When we are reading a file, if we are not at the end
# of the file, then 'line' will be something. In Ruby:
#
# Any value is true
# nil is False
# True is True
# False is False
# 0 is true (in sensible languages 0 is false. This is NOT the case in Ruby. Ask yourself why this is)
#
# So at the end of the file, 'gets' will return 'nil', and the while loop wont execute
while line = wordFile.gets
	# we want to take any word that has length greater than 8
	# First we strip it because we don't want any whitespace on the ends
	# then we call 'length' on it to see how long it is
	# if it is less than eight, we say 'next.' 'Next' will skip
	# to the next iteration fo the current block. We are currently inside the
	# while loop, so we will skip to the next line of the file
	if line.strip.length < 8 then next end

	# trim the white space, split the characters into an array.
	# and then sort the array to get the key
	sortedline = line.strip.split("").sort.join

	# we want to chec if the key we found is already in our dictionary.
	# if it isn't, we should add the key to our dictionary
	if wordHash[sortedline] == nil
		# "hash is nil" so create a new array as the value to that key.
		# we are using an array because words have anagrams, and when
		# we sort  'bad' and 'dab,' they will be the same thing.
		wordHash[sortedline] = Array.new()
	end

	# We add the word to the list of anagrams for that key
	# Super simple stuff.
	wordHash[sortedline] << line.strip
end

#we split the total hash up into four hash groups by size
puts "Organizing by size"

# so what we are doing is we are grouping the hashes by a certain value
# that way we can identify clumps that share a similar property, namely
# the length of the array.
wordHash = wordHash.group_by{|key,value| value.length }
# delete all anagrams that have one value in their list
puts "Deleting words that have no anagrams"
wordHash.delete(1)

# we want to print value in the anagram list
wordHash.each do |key,anagramSet|

	# we order each anagram set by the word length
	# k[0] contains the key or sorted word
	puts "Writing #{key}-grams"
	anagramSet = anagramSet.sort_by{ |k| k[1].first.length}

	# in this do block we want to pick out each
	# set of words, and then each word.
	anagramSet.each do |words|
		# we now have access to each array of anagrams,
		# so we print each one in that set
		words[1].each do |word|
			# print word + " "
			anagramFile.print word + " "
		end
		# puts ""
		anagramFile.puts ""
	end
end

# we are done!
puts "Done!"
