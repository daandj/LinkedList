class LinkedList

  def initialize
    @head = Node.new(:head, Node.new(:tail, nil))
  end
  
  def prepend(value)
    @head.insert_after(value)
  end

  def append(value)
    node = @head
    loop do 
      if node.pointer.value == :tail
	node.insert_after(value)
	break
      end
      node = node.pointer
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

