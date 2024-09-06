# frozen_string_literal: true

require_relative './money'

RSpec.describe 'Money' do
  it '金額に数値をかけると金額を得られること' do
    five = Dollar.new(5)

    product = five.times(2)
    expect(product.amount).to eq(10)

    product = five.times(3)
    expect(product.amount).to eq(15)
  end
end
