# frozen_string_literal: true

require_relative './effects'

RSpec.describe 'effects' do
  context 'effects' do
    it 'Effects が取り敢えず参照できること' do
      expect { Effects }.not_to raise_error
    end

    it 'reverse effect で単語が反転すること' do
      reverse_effect = Effects.reverse
      expect(reverse_effect.call('Ruby is fun!')).to eq('ybuR si !nuf')
    end

    it 'echo(2) effect で文字が2回繰り返されること' do
      echo2_efect = Effects.echo(2)
      expect(echo2_efect.call('Ruby is fun!')).to eq('RRuubbyy iiss ffuunn!!')
    end

    it 'echo(3) effect で文字が3回繰り返されること' do
      echo3_efect = Effects.echo(3)
      expect(echo3_efect.call('Ruby is fun!')).to eq('RRRuuubbbyyy iiisss fffuuunnn!!!')
    end

    it 'loud(2) effect で文字列が大文字になり、単語の末尾に ! が2つ付くこと' do
      loud2_efect = Effects.loud(2)
      expect(loud2_efect.call('Ruby is fun!')).to eq('RUBY!! IS!! FUN!!!')
    end

    it 'loud(3) effect で文字列が大文字になり、単語の末尾に ! が3つ付くこと' do
      loud3_efect = Effects.loud(3)
      expect(loud3_efect.call('Ruby is fun!')).to eq('RUBY!!! IS!!! FUN!!!!')
    end
  end
end
