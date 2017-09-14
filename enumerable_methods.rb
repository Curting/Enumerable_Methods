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

  def my_none?
    statement = true

    self.my_each do |element|
      statement = false if yield(element)
    end

    statement
  end

  def my_count(n = nil)
    count = 0

    self.my_each do |element|
      if n != nil
        count += 1 if element == n
      elsif block_given?
        count += 1 if yield(element)
      end
    end

    count
  end

  def my_map
    temp_array = []
    for elements in self
      temp_array << yield(elements)
    end

    temp_array
  end

end

#any?, #none?, #count, #map