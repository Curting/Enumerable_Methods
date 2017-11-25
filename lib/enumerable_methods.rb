module Enumerable

  def my_each
    if block_given?
      for elements in self
        yield(elements)
      end
    else
      self.to_enum
    end
  end

  def my_each_with_index
    if block_given?
      i = 0

      for elements in self
        yield(elements, i)
        i += 1
      end

      self
    else
      self.to_enum
    end
  end

  def my_select
    if block_given?
      selected = []

      self.my_each do |element|
        selected << element if yield(element)
      end

      selected
    else
      self.to_enum
    end
  end

  def my_all?
    statement = true

    if block_given?
      self.my_each do |element|
        statement = false if not yield(element)
      end
    end

    statement
  end

  def my_any?
    if block_given?
      statement = false

      self.my_each do |element|
        statement = true if yield(element)
      end
    else
      statement = true
    end

    statement
  end

  def my_none?
    if block_given?
      statement = true

      self.my_each do |element|
        statement = false if yield(element)
      end
    else
      statement = false
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
    if block_given?
      temp_array = []

      for elements in self
        temp_array << yield(elements)
      end

      temp_array
    else
      self.to_enum
    end
  end

  # Make #my_map accept a proc
  def my_map_proc(proc = nil)
    if proc != nil
      temp_array = []

      for elements in self
        temp_array << proc.call(elements)
      end

      temp_array
    else
      self.to_enum
    end
  end

  # Make #my_map accept a block or proc
  def my_map_any(&block)
    if block_given?
      temp_array = []

      for elements in self
        temp_array << yield(elements)
      end

      temp_array
    else
      self.to_enum
    end
  end

  def my_inject(total = nil)
    # This method is flawed, since it doesn't accept two
    # parameters or one + a block. Too difficult right now.

    if total == nil
      total = self[0]
      self[1..-1].my_each do |element|
        total = yield(total, element)
      end

    else
      self.my_each do |element|
        total = yield(total, element)
      end
    end

    total
  end

end

def multiply_els(obj)
  obj.my_inject {|sum, x| sum * x}
end