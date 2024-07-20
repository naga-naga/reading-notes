require_relative './convert_hash_syntax'

RSpec.describe 'convert_hash_syntax' do
  context 'convert_hash_syntax' do
    it '空のハッシュは空のハッシュになること' do
      expect(convert_hash_syntax('{}')).to eq('{}')
    end

    it ':symbol => value のハッシュが symbol: value のハッシュになること' do
      old_syntax = <<~TEXT
        {
          :name => 'Alice',
          :age=>20,
          :gender   =>   :female
        }
      TEXT
      expected = <<~TEXT
        {
          name: 'Alice',
          age: 20,
          gender: :female
        }
      TEXT

      expect(convert_hash_syntax(old_syntax)).to eq(expected)
    end
  end
end
