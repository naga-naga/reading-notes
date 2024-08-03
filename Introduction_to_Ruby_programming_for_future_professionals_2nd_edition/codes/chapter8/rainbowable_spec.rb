require_relative './rainbowable'

RSpec.describe 'rainbow' do
  context 'rainbow' do
    before do
      String.include(Rainbowable)
      Array.include(Rainbowable)
    end

    let(:obj) { Object.new.extend(Rainbowable) }

    it 'Rainbowable を参照可能なこと' do
      expect { obj.rainbow }.not_to raise_error
    end

    it '文字列が虹色になること' do
      expect('Hello, world!'.rainbow).to(
        eq("\e[31mH\e[32me\e[33ml\e[34ml\e[35mo\e[36m,\e[31m \e[32mw\e[33mo\e[34mr\e[35ml\e[36md\e[31m!\e[0m")
      )
    end

    it '配列が虹色になること' do
      expect([1, 2, 3].rainbow).to eq("\e[31m[\e[32m1\e[33m,\e[34m \e[35m2\e[36m,\e[31m \e[32m3\e[33m]\e[0m")
    end
  end
end
