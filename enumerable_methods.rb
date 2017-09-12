module Enumerable

  def my_each
    for elements in self
      yield(elements)
    end
  end

  def my_each_with_index
    n = self.length
    i = 0

    n.times do |element|
      yield(self[i], i)
      i += 1
    end

    self
  end

end