# frozen_string_literal: true

require_relative './log_formatter'

RSpec.describe 'log_formatter' do
  context 'log_formatter' do
    it '取り敢えず参照できること' do
      expect { LogFormatter.format_log }.not_to raise_error
    end

    it 'ログの1行目が "[OK] request_id=1, path=/products/1" であること' do
      text = LogFormatter.format_log
      lines = text.lines(chomp: true)
      expect(lines[0]).to eq('[OK] request_id=1, path=/products/1')
    end

    it 'ログの2行目が "[ERROR] request_id=2, path=/wp-login.php, status=404, error=Not found" であること' do
      text = LogFormatter.format_log
      lines = text.lines(chomp: true)
      expect(lines[1]).to eq('[ERROR] request_id=2, path=/wp-login.php, status=404, error=Not found')
    end

    it 'ログの3行目が "[ERROR] request_id=2, path=/wp-login.php, status=404, error=Not found" であること' do
      text = LogFormatter.format_log
      lines = text.lines(chomp: true)
      expect(lines[2]).to eq('[WARN] request_id=3, path=/products, duration=1023.8')
    end

    it 'ログの4行目が "[ERROR] request_id=4, path=/dangerous, status=500, error=Internal server error" であること' do
      text = LogFormatter.format_log
      lines = text.lines(chomp: true)
      expect(lines[3]).to eq('[ERROR] request_id=4, path=/dangerous, status=500, error=Internal server error')
    end
  end
end

# [{:request_id=>"1", :path=>"/products/1", :status=>200, :duration=>651.7},
#  {:request_id=>"2", :path=>"/wp-login.php", :status=>404, :duration=>48.1, :error=>"Not found"},
#  {:request_id=>"3", :path=>"/products", :status=>200, :duration=>1023.8},
#  {:request_id=>"4", :path=>"/dangerous", :status=>500, :duration=>43.6, :error=>"Internal server error"}]