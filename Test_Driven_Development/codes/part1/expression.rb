# frozen_string_literal: true

module Expression
  def plus(_addend)
    raise NotImplementedError, 'Expression#plus を実装してください'
  end

  def reduce(_bank, _to)
    raise NotImplementedError, 'Expression#reduce を実装してください'
  end
end
