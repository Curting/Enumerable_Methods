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

  def my_select
    selected = []

    self.my_each do |element|
      selected << element if yield(element)
    end

    selected
  end

  def my_all?
    statement = true

    self.my_each do |element|
      statement = false if not yield(element)
    end

    statement
  end

  def my_any?
    statement = false

    self.my_each do |element|
      statement = true if yield(element)
    end

    statement
  end

end

#any?, #none?, #count, #map