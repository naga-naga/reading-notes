# frozen_string_literal: true

require_relative './dollar'
require_relative './franc'

RSpec.describe 'Money' do
  context 'Dollar について' do
    it '金額に数値をかけると金額を得られること' do
      five = Money.dollar(5)
      expect(five.times(2)).to eq(Money.dollar(10))
      expect(five.times(3)).to eq(Money.dollar(15))
    end

    it '同じ金額の Dollar オブジェクトが等しいが、異なる金額の Dollar オブジェクトは等しくないこと' do
      expect(Money.dollar(5)).to eq(Money.dollar(5))
      expect(Money.dollar(5)).not_to eq(Money.dollar(6))
    end

    it '同じ額面の Dollar と Franc が等しくないこと' do
      expect(Money.dollar(5)).not_to eq(Money.franc(5))
    end
  end

  context 'Franc について' do
    it '金額に数値をかけると金額を得られること' do
      five = Money.franc(5)
      expect(five.times(2)).to eq(Money.franc(10))
      expect(five.times(3)).to eq(Money.franc(15))
    end

    it '同じ金額の Franc オブジェクトが等しいが、異なる金額の Franc オブジェクトは等しくないこと' do
      expect(Money.franc(5)).to eq(Money.franc(5))
      expect(Money.franc(5)).not_to eq(Money.franc(6))
    end
  end
end
