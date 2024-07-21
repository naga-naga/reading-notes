require_relative './gate'
require_relative './ticket'

RSpec.describe 'gate' do
  context 'gate' do
    let!(:umeda) { Gate.new(:umeda) }
    let!(:juso) { Gate.new(:juso) }
    let!(:mikuni) { Gate.new(:mikuni) }

    it '160円の切符で梅田から入場して十三で出場できること' do
      ticket = Ticket.new(160)
      umeda.enter(ticket)
      expect(juso.exit(ticket)).to eq(true)
    end

    it '160円の切符で梅田から入場して三国で出場できないこと' do
      ticket = Ticket.new(160)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to eq(false)
    end

    it '190円の切符で梅田から入場して三国で出場できること' do
      ticket = Ticket.new(190)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to eq(true)
    end

    it '160円の切符で十三から入場して三国で出場できること' do
      ticket = Ticket.new(160)
      juso.enter(ticket)
      expect(mikuni.exit(ticket)).to eq(true)
    end
  end
end
