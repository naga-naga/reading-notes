# frozen_string_literal: true

require_relative './money'
require_relative './bank'

RSpec.describe 'Money' do
  it '同じ通貨の足し算ができること' do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
    expect(reduced).to eq(Money.dollar(10))
  end

  it '通貨の掛け算ができること' do
    five = Money.dollar(5)
    expect(five.times(2)).to eq(Money.dollar(10))
    expect(five.times(3)).to eq(Money.dollar(15))
  end

  it '同じ金額の Money オブジェクトが等しいが、異なる金額の Money オブジェクトは等しくないこと' do
    expect(Money.dollar(5)).to eq(Money.dollar(5))
    expect(Money.dollar(5)).not_to eq(Money.dollar(6))
  end

  it '同じ額面の Dollar と Franc が等しくないこと' do
    expect(Money.dollar(5)).not_to eq(Money.franc(5))
  end

  it 'オブジェクトから通貨が得られること' do
    expect(Money.dollar(1).currency).to eq('USD')
    expect(Money.franc(1).currency).to eq('CHF')
  end
end
