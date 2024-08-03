module Loggable
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable

  def title
    log('title is called')
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log('name is called')
    'Alice'
  end
end

Product.new.title
User.new.name

# ---

class Product2
  extend Loggable

  def self.title
    log('title is called')
    'A great movie'
  end
end

class User2
  extend Loggable

  def self.name
    log('name is called')
    'Alice'
  end
end

Product2.title
User2.name
