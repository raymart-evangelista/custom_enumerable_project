module Enumerable
  def my_each_with_index(&blk)
    idx = 0
    my_each do |elem|
      blk.call(elem, idx)
      idx += 1
    end
    self
  end

  def my_select(&blk)
    matched_elems = []
    my_each do |elem|
      matched_elems.push(elem) if blk.call(elem)
    end
    matched_elems
  end

  def my_all?(&blk)
    met_conditions = false
    my_each do |elem|
      met_conditions = if blk.call(elem)
                         true
                       else
                         false
                       end
    end
    met_conditions
  end

  def my_any?(&blk)
    my_each do |elem|
      if blk.call(elem)
        return true
      end
    end
    false
  end

  def my_none?(&blk)
    my_each do |elem|
      if blk.call(elem)
        return false
      end
    end
    true
  end

  def my_count(&blk)
    count = 0
    if block_given?
      my_each do |elem|
        count += 1 if blk.call(elem)
      end
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map(&blk)
    new_arr = []
    my_each do |elem|
      new_arr.push(blk.call(elem))
    end
    new_arr
  end

  def my_inject(value, &blk)
    my_each do |elem|
      value = blk.call(elem, value)
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
  def my_each(&blk)
    i = 0
    while i < count
      elem = self[i]
      blk.call(elem)
      i += 1
    end
    self
  end
end