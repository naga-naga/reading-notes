# frozen_string_literal: true

require_relative './effects'
require_relative './word_synth'

RSpec.describe 'word_synth' do
  context 'word_synth' do
    it 'Effects が取り敢えず参照できること' do
      expect { Effects }.not_to raise_error
    end

    it 'WordSynth が取り敢えず参照できること' do
      expect { WordSynth }.not_to raise_error
    end

    it 'play を呼び出した際に effect を適用していないと文字列がそのまま返ること' do
      synth = WordSynth.new
      expect(synth.play('Ruby is fun!')).to eq('Ruby is fun!')
    end

    it 'reverse effect を適用していると単語が反転すること' do
      synth = WordSynth.new
      synth.add_effect(Effects.reverse)
      expect(synth.play('Ruby is fun!')).to eq('ybuR si !nuf')
    end

    it 'echo(2), loud(3), reverse effect を適用して文字列にエフェクトがかかること' do
      synth = WordSynth.new
      synth.add_effect(Effects.echo(2))
      synth.add_effect(Effects.loud(3))
      synth.add_effect(Effects.reverse)
      expect(synth.play('Ruby is fun!')).to eq('!!!YYBBUURR !!!SSII !!!!!NNUUFF')
    end
  end
end
