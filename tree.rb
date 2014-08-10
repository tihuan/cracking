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


# A node's height is the max of its subtree's heights + 1
def height(node)
  return 0 if node.nil?
  return 1 + [height(node.left), height(node.right)].max
end

# VLR
def preorder_trav(node)
  return if node.nil?
  p node.value
  preorder_trav(node.left)
  preorder_trav(node.right)
end

# LVR
# 1 -> 3 -> 4 -> 5 -> 7 -> 10 -> 12
def inorder_trav(node)
  return if node.nil?
  inorder_trav(node.left)
  p node.value
  inorder_trav(node.right)
end

#LRV
# 1 -> 4 -> 3 -> 7 -> 12 -> 10 -> 5
def postorder_trav(node)
  return if node.nil?
  postorder_trav(node.left)
  postorder_trav(node.right)
  p node.value
end

# go left if current_value > targets, go right if current_value < targets, else return
def common_ancestor(node, small, large)
  return false if node == nil
  if small.value < node.value && large.value < node.value
    common_ancestor(node.left, small, large)
  elsif small.value > node.value && large.value > node.value
    common_ancestor(node.right, small, large)
  else
    return node
  end
end

def common_ancestor_iterative(node, small, large)
  while node != nil
    if node.value > small.value && node.value > large.value
      node = node.left
    elsif node.value < small.value && node.value < large.value
      node = node.right
    else
      return node
    end
  end
  false
end

# p search(root, 12).value == 12
# p search(root, 1).value == 1
# p search(root, 5).value == 5
# p search(root, 99) == false

# p recursive_search(root, 12).value == 12
# p recursive_search(root, 1).value == 1
# p recursive_search(root, 5).value == 5
# p recursive_search(root, 13).value == 13
# p recursive_search(root, 99) == false

# p height(root) == 4

# preorder_trav(root) # 5 -> 3 -> 1 -> 4 -> 10 -> 7 -> 12 -> 13
# inorder_trav(root) # 1 -> 3-> 4 -> 5 -> 7 -> 10 -> 13 -> 12 ((remember 13 is the right node))
# postorder_trav(root) # 1 -> 4 -> 3 -> 7 -> 13 -> 12 -> 10 -> 5

# p common_ancestor(root, node7, node13).value == 10
# p common_ancestor(root, node1, node13).value == 5

# p common_ancestor_iterative(root, node7, node13).value == 10
# p common_ancestor_iterative(root, node1, node13).value == 5
