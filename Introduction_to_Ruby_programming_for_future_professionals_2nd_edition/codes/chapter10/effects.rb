# frozen_string_literal: true

module Effects # rubocop:disable Style/Documentation
  def self.reverse
    lambda do |words|
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    lambda do |words|
      words.each_char.map { _1 == ' ' ? _1 : _1 * rate }.join
      # words.each_char.map { _1 * rate }.join.squeeze(' ')
    end
  end

  def self.loud(level)
    lambda do |words|
      words.split(' ').map { "#{_1.upcase}#{'!' * level}" }.join(' ')
    end
  end
end
