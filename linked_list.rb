require_relative "node.rb"
class LinkedList
  
  def initialize
    @head = nil
  end

  def append (node)
    new_node = Node.new(node)
    if !@head
      @head = new_node
    else
    temp = @head
      while temp.next_node
        temp = temp.next_node
      end
    temp.next_node = new_node
    end
  end

  def prepend (node) 
    new_node = Node.new(node)
    if !@head
      @head = new_node
    else
    new_node.next_node = @head
    @head = new_node
    end
  end

  def size
    return 0 unless @head
    temp = @head
    count = 0
    while temp
      count += 1
      temp = temp.next_node
    end
    count
  end

  def head
    return "There are no nodes in List" if self.size == 0
    return "Empty" unless @head.value
    @head.value
  end

  def tail
    return "There are no nodes in List" if self.size == 0
    temp = @head
    while temp.next_node
      temp = temp.next_node
    end
    return "Empty" unless temp.value
    temp.value
  end

  def at (index)
    raise ArgumentError.new("Cannot use a negative index") if index < 0
    return "Index is out of the list" if index > self.size - 1
    return nil unless @head
    temp = @head
    index.times do |i|
      temp = temp.next_node
    end
    temp.value
  end

  def pop
    return "There is nothing to pop" unless @head
    temp = @head
    while temp.next_node.next_node
      temp = temp.next_node
    end
    temp.next_node = nil
    temp.value
  end

  def contains?(something)
    return false unless @head
    temp = @head
    while temp.next_node
      return true if temp.value == something 
      temp = temp.next_node
    end
    temp.value == something 
  end

  def find (data)
    return nil unless @head
    temp = @head
    self.size.times do |i|
      return i if self.at(i) == data 
    end
    nil
  end
  
  def to_s
    output = ""
    return "The list is empty" unless @head
    self.size.times do |i|
      output << "(#{self.at(i)})->" 
    end
    output << "nil"
  end

  def insert_at(node, index)
    raise ArgumentError.new("Cannot use a negative index") if index < 0
    return "Index is out of the list" if index > self.size 

    new_node = Node.new (node)

    if index == 0
      new_node.next_node = @head
      @head = new_node
      
    else

    temp = @head
    (index - 1).times do |i|
      temp = temp.next_node
    end
    new_node.next_node = temp.next_node
    temp.next_node = new_node
    end
  end

  def remove_at(index)
    raise ArgumentError.new("Cannot use a negative index") if index < 0
    return "Index is out of the list" if index > self.size - 1

    if index == 0
      removed = @head
      @head = @head.next_node
    else
    
    temp = @head
    ( index - 1 ).times do |i|
      temp = temp.next_node
    end
    removed = temp.next_node
    temp.next_node = temp.next_node.next_node
    end
    removed
  end
end
