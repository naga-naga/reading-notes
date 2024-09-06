# frozen_string_literal: true

require_relative './money'

RSpec.describe 'Money' do
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
