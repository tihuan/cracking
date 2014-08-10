#  Binary Search Tree

class Node
  attr_accessor :left, :right, :value

  def initialize(value = nil, left = nil, right = nil)
    @left = left
    @right = right
    @value = value
  end
end

node1 = Node.new(1)
node4 = Node.new(4)
node7 = Node.new(7)
node13 = Node.new(13)
node12 = Node.new(12, nil, node13)
node3 = Node.new(3, node1, node4)
node10 = Node.new(10, node7, node12)
root = Node.new(5, node3, node10)

def search(root, value)
  if root.value == value
    root
  else
    current_node = root
    while current_node
      return current_node if current_node.value == value
      if current_node.value > value
        current_node = current_node.left
      else
        current_node = current_node.right if current_node.value < value
      end
    end
    false
  end
end

def recursive_search(node, value)
  return false if node.nil?
  return node if node.value == value
  if node.value > value
    recursive_search(node.left, value)
  else
    recursive_search(node.right, value)
  end
end

p search(root, 12).value == 12
p search(root, 1).value == 1
p search(root, 5).value == 5
p search(root, 99) == false

p recursive_search(root, 12).value == 12
p recursive_search(root, 1).value == 1
p recursive_search(root, 5).value == 5
p recursive_search(root, 13).value == 13
p recursive_search(root, 99) == false

