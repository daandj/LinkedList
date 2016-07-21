class LinkedList

  def initialize
    @head = Node.new(:head, Node.new(:tail, nil))
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

