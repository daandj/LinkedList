class Node
  attr_accessor :value, :pointer

  def initialize(value, pointer)
    @value = value
    @pointer = pointer
  end

  def insert_next(value)
    @pointer = Node.new(value, @pointer)
  end

  def delete_next
    new_pointer = @pointer.pointer
    @pointer.pointer = 0
    @pointer = new_pointer
  end

end
