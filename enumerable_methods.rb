module Enumerable

  def my_each
    for elements in self
      yield(elements)
    end
  end

  def my_each_with_index
    i = 0

    for elements in self
      yield(elements, i)
      i += 1
    end

    self
  end

end