# frozen_string_literal: true

require_relative './rgb'

RSpec.describe 'rgb' do
  context 'to_hex' do
    it '10進数の 0..255 の範囲内の整数を3つ与えると #RRGGBB の形式で返ること' do
      expect(to_hex(  0,   0,   0)).to eq('#000000')
      expect(to_hex(255, 255, 255)).to eq('#FFFFFF')
      expect(to_hex(  4,  60, 120)).to eq('#043C78')
    end
  end

  context 'to_ints' do
    it '#RRGGBB 形式の文字列を与えると、整数の配列として返ること' do
      expect(to_ints('#000000')).to eq([  0,   0,   0])
      expect(to_ints('#FFFFFF')).to eq([255, 255, 255])
      expect(to_ints('#043C78')).to eq([  4,  60, 120])
    end
  end
end
