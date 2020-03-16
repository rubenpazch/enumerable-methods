text=''
line_count = 0
File.open("text.txt").each do |line|
line_count += 1
text << line
end
puts "#{line_count} lines"

lines = File.readlines("text.txt")
puts lines.class
line_count = lines.size
#text = lines.join
puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"

puts "this is a test".gsub(/t/, 'X')

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"

puts "this is a test".scan(/\w/).join
puts "this is a test".scan(/\w+/).join('-')
puts "this is a test".scan(/\w+/).length
puts "this is a test".split.length

#text = "First-class decisions require clear-headed thinking."
puts "Scan method: #{text.scan(/\w+/).length}"
puts "Split method: #{text.split.length}"

word_count = text.split.length
puts "#{word_count} words"

sentence_count = text.split(/\.|\?|!/).length
puts sentence_count



paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"
sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"