#  Binary Search Tree

class Node
  attr_accessor :left, :right, :value

  def initialize(value = nil, left = nil, right = nil)
    @left = left
    @right = right
    @value = valueend
  end
end

node1 = Node.new(1)
node4 = Node.new(4)
node7 = Node.new(7)
node12 = Node.new(12)
node3 = Node.new(3, node1, node4)
node10 = Node.new(10, node7, node12)
root = Node.new(5, node3, node10)


