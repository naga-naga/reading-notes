# frozen_string_literal: true

require_relative './convert_length'

RSpec.describe 'convert_lentgh' do
  context 'convert_lentgh' do
    it 'メートルをインチに変換できること' do
      expect(convert_length(1, from: :m, to: :in)).to eq(39.37)
    end

    it 'インチをメートルに変換できること' do
      expect(convert_length(15, from: :in, to: :m)).to eq(0.38)
    end

    it 'フィートをメートルに変換できること' do
      expect(convert_length(35000, from: :ft, to: :m)).to eq(10670.73)
    end
  end
end
