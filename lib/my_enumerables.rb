module Enumerable
  def my_each_with_index
    counter = 0
    my_each do |obj|
      yield obj, counter
      counter += 1
    end
    self
  end

  def my_select
    matched_elems = []
    my_each do |i|
      matched_elems.push(i) if yield(i)
    end
    matched_elems
  end

  def my_all?
    met_conditions = false
    my_each do |i|
      if yield(i)
        met_conditions = true
      else
        met_conditions = false
      end
    end
    met_conditions
  end

  def my_any?
    my_each do |i|
      if yield(i)
        return true
      end
    end
    false
  end

  def my_none?
    my_each do |i|
      if yield(i)
        return false
      end
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      my_each do |i|
        if yield(i)
          count += 1
        end
      end
      return count
    end
    my_each do
      count += 1
    end
    count
  end

  def my_map
    new_arr = []
    my_each do |i|
      new_arr.push(yield(i))
    end
    new_arr
  end

  def my_inject(value)
    my_each do |i|
      value = yield(i,value)
    end
    value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    size.times do |i|
      yield self.at(i)
    end
    self
  end
end
