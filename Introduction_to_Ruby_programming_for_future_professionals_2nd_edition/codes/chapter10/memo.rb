# frozen_string_literal: true

def greet
  puts 'hello'

  if block_given?
    text = yield 'arg'
    puts text
  end

  puts 'bye'
end

# greet
# puts

greet do |text|
  puts "foo! #{text}"
  puts text * 3
  'return value'
end

puts '---'

# 明示的なブロック受け取り
def greet2(&block)
  block&.call
end

greet2 do
  puts 'hello!'
end

puts '---'

def greet_ja(&block)
  texts = ['おはよう', 'こんにちは', 'こんばんは'] # rubocop:disable Style/WordArray
  greet_common(texts, &block)
end

def greet_en(&block)
  texts = ['good morning', 'hello', 'good evening']
  greet_common(texts, &block)
end

def greet_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1])
  puts texts[2]
end

greet_ja do |text|
  text * 2
end

greet_en(&:upcase)

puts '---'

# arity
def greet_arity(&block) # rubocop:disable Metrics/MethodLength
  puts 'おはよう'
  text =
    if block.arity == 1
      yield 'こんにちは'
    elsif block.arity == 2
      yield 'こんに', 'ちは'
    else
      yield
    end
  puts text
  puts 'こんばんは'
end

greet_arity do |text|
  text * 2
end

greet_arity do |text1, text2|
  text1 * 2 + text2 * 2
end

puts '---'
def generate_proc(array)
  counter = 0

  proc do
    counter += 10
    array << counter
  end
end

values = []
sample_proc = generate_proc(values)

puts "1: #{values}"
sample_proc.call
puts "2: #{values}"
sample_proc.call
sample_proc.call
puts "3: #{values}"
sample_proc.call
puts "4: #{values}"
