module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    i = 0
    while i < self.length
      result << self[i] if yield(self[i])
      i += 1
    end
    result
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    i = 0
    while i < self.length
      return false unless yield(self[i])
      i += 1
    end
    true
  end
  
  def my_any?
    return to_enum(:my_any?) unless block_given?

    i = 0
    while i < self.length
      return true if yield(self[i])
      i += 1
    end
    false
  end
  
  def my_none?
    return to_enum(:my_none?) unless block_given?

    i = 0
    while i < self.length
      return false if yield(self[i])
      i += 1
    end
    true
  end
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
