# frozen_string_literal: true

module Expression
  def reduce(_to)
    raise NotImplementedError, 'Expression#reduce を実装してください'
  end
end
