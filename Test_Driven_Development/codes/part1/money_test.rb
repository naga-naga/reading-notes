# frozen_string_literal: true

require_relative './dollar'
require_relative './franc'

RSpec.describe 'Money' do
  context 'Dollar について' do
    it '金額に数値をかけると金額を得られること' do
      five = Dollar.new(5)
      expect(five.times(2)).to eq(Dollar.new(10))
      expect(five.times(3)).to eq(Dollar.new(15))
    end

    it '同じ金額の Dollar オブジェクトが等しいが、異なる金額の Dollar オブジェクトは等しくないこと' do
      expect(Dollar.new(5)).to eq(Dollar.new(5))
      expect(Dollar.new(5)).not_to eq(Dollar.new(6))
    end
  end

  context 'Franc について' do
    it '金額に数値をかけると金額を得られること' do
      five = Franc.new(5)
      expect(five.times(2)).to eq(Franc.new(10))
      expect(five.times(3)).to eq(Franc.new(15))
    end

    it '同じ金額の Franc オブジェクトが等しいが、異なる金額の Franc オブジェクトは等しくないこと' do
      expect(Franc.new(5)).to eq(Franc.new(5))
      expect(Franc.new(5)).not_to eq(Franc.new(6))
    end
  end
end
