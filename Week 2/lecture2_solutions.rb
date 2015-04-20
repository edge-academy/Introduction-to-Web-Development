words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


anagrams = {}

words.each do |word|
  sorted_word = word.chars.sort.join
  if anagrams[sorted_word]
    anagrams[sorted_word] += [word]
  else
    anagrams[sorted_word] = [word]
  end
end

# Or we can initialize our hash to use [] as our default value for any key
# so that we can directly push new words into a key's value without
# checking for nil

#anagrams = Hash.new([])

# words.each do |word|
#   sorted_word = word.chars.sort.join
#   anagrams[sorted_word] += [word]
# end

p anagrams
