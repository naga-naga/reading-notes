# frozen_string_literal: true

module Expression # rubocop:disable Style/Documentation
  def reduce(_to)
    raise NotImplementedError, 'Expression#reduce を実装してください'
  end
end
