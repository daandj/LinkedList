class Node
  attr_accessor :value, :pointer

  def initialize(value, pointer)
    @value = value
    @pointer = pointer
  end

  def insert_after(value)
    @pointer = Node.new(value, @pointer)
  end

end
