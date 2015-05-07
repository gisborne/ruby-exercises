class CountLeaves
  def count_leaves c
    puts "This is c: #{c}"
    if c.is_a? Array
      puts "#{c} is an Array. Now calling count_array..."
      count_array c
    elsif c.is_a? Hash
      count_hash c
    else
      1
    end
  end

  private

  def count_array c
    return 0 if c == []
    first = c.shift
    puts "c is #{c}. The first value of c is #{first}"
    count_leaves(first) + count_array(c)
  end

  def count_hash c
    return 0 if c == {}
    #TODO finish
  end
end
