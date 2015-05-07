class CountLeaves
  def count_leaves c
    puts "This is c: #{c}"
    if c.is_a? Array
      puts "#{c} is an Array. Now calling count_array..."
      count_array c
    elsif c.is_a? Hash
      puts "#{c} is an Hash. Now calling count_hash..."
      count_hash c
    else
      1
    end
  end

  private

  def count_array c
    return 0 if c == []
    first = c.shift
    puts "ARRAY: c is #{c}. The first value of c is #{first}"
    count_leaves(first) + count_array(c)
  end


  def count_hash c
    return 0 if c == {}
    first = c.shift
    puts "HASH: c is #{c}. The first value of c is #{first}"
    return count_leaves(first[1]) + count_leaves(c)
  end
end

name = CountLeaves.new
name.count_leaves [12,23,[3,65,[5]], a: 5]
