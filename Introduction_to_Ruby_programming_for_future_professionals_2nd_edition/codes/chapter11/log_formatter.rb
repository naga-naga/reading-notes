# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module LogFormatter # rubocop:disable Style/Documentation
  def self.format_log # rubocop:disable Metrics/MethodLength
    uri = URI.parse('https://samples.jnito.com/access-log.json')
    json = Net::HTTP.get(uri)
    log_data = JSON.parse(json, symbolize_names: true)

    log_data.map do |log|
      case log
      in { request_id:, path:, status: 404 | 500 => status, error: }
        "[ERROR] request_id=#{request_id}, path=#{path}, status=#{status}, error=#{error}"
      in { request_id:, path:, duration: 1000.. => duration }
        "[WARN] request_id=#{request_id}, path=#{path}, duration=#{duration}"
      in { request_id:, path: }
        "[OK] request_id=#{request_id}, path=#{path}"
      end
    end.join("\n")
  end
end
