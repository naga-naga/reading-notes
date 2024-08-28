# frozen_string_literal: true

require_relative './money'

RSpec.describe 'Money' do
  it '金額に数値をかけると金額を得られること' do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq(10)
  end
end
