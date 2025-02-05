# frozen_string_literal: true

class WordSynth # rubocop:disable Style/Documentation
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    # words = original_words
    # @effects.each do |effect|
    #   words = effect.call(words)
    # end
    # words
    @effects.inject(original_words) do |words, effect|
      effect.call(words)
    end
  end
end
