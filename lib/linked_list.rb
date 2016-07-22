class LinkedList

  def initialize
    @head = Node.new(:head, Node.new(:tail, nil))
  end
  
  def prepend(value)
    @head.insert_next(value)
  end

  def append(value)
    node = @head
    loop do 
      if node.pointer.value == :tail
	node.insert_next(value)
	break
      end
      node = node.pointer
    end
  end

  def size
    count = 0
    crawl_list { |node| count += 1 }
    count
  end
  
  def head
    return @head
  end

  def tail
    node = @head
    loop do
      if node.value == :tail
	return node
      end
      node = node.pointer
    end
  end

  def at(index)
    count = 0
    crawl_list do |node|
      if count == index
	return node
      else
	count += 1
      end
    end
  end

  def pop
    crawl_list do |node|
      if node.pointer.pointer.value == :tail
	node.delete_next
      end
    end
  end

  def contains?(value)
    crawl_list do |node|
      if node.value == value
	return true
      end
    end
    return false
  end

  def find(value)
    count = 0
    crawl_list do |node|
      if node.value == value
	return count
      end
      count += 1
    end
  end
  
  def to_s
    string = ""
    crawl_list do |node| 
      string += "( #{node.value} ) -> " 
    end
    string += "nil"
  end
  
  private

  def crawl_list
    node = @head
    while node.pointer.value != :tail
      node = node.pointer
      yield(node)
    end
  end

end

