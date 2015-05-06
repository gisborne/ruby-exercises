#When doing this exercise, use methods when appropriate to keep things organized.
snowy = File.read 'the-man-from-snowy-river.txt'
clancy = File.read 'clancy-of-the-overflow.txt'
snowy_words = snowy.split /\W+/
clancy_words = clancy.split /\W+/

#A set is a data structure that can have things added and removed, and you can ask if things are in it. You can make one from an array
@words = File.read('/usr/share/dict/words').lines.map{|w| w.chomp}
@words = @words.select{|word| word >= 'a' && word <= 'z'}.to_a
def in_dictionary word
  @words.include? word.downcase
end
#We can treat arrays as sets, and use + for union, - for difference
puts "Words in snowy but not clancy"
puts (snowy_words - clancy_words).uniq.join ', '

puts
puts "… and the reverse"
puts (clancy_words - snowy_words).uniq.join ', '

#The above are great, but note that we get both 'There' and 'there' separately (and others). Fix that.

puts
puts "The longest word in snowy is"

puts "#{snowy_words.sort_by{|word| word.length}.last}"

#Here, find the words that are in Snowy but not in the dictionary
puts
puts "Names in Snowy are:"

puts "#{snowy_words.select{|word| !in_dictionary word}.uniq.join ', '}"
#Look up the documentation for Set to see how to test if a word is in it or not

puts
puts "Names in both Snowy and Clancy:"
puts "#{(snowy_words & clancy_words).select{|word| !in_dictionary word}.join ', '}"


#Change this so it uses an array rather than a set. Marvel at how much slower it is.
#You can time how long something takes to run in bash by doing time before the command.
#So time ruby ruby-exercise-5.rb will tell you how long that took to run
