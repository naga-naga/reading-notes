print 'Text: '
text = gets.chomp

begin
  print 'Pattern: '
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

matches = text.scan(regexp)
if matches.size.positive?
  puts "Matched: #{matches.join(', ')}"
else
  puts 'Nothing matched.'
end
