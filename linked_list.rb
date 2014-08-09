require 'pry'
class Node
  attr_accessor :value, :next
  def initialize(value = nil)
    @value = value
  end

  def to_s
    value
  end
end

class LinkedList
  attr_accessor :head

  def initialize(first_value = nil)
    @head = Node.new(first_value) if first_value
  end

  def add(value)
    if head.nil?
      @head = Node.new(value)
    else
      current_node = head
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = Node.new(value)
    end
  end

  def find(value)
    current_node = head
    while current_node
      return current_node if current_node.value == value
      current_node = current_node.next
    end
    nil
  end

  def remove(value)
    if head.value == value
      @head = head.next
    else
      prev_node, current_node = head, head.next
      while current_node
        if current_node.value == value
          prev_node.next = current_node.next
          return true
        end
        prev_node, current_node = current_node, current_node.next
      end
      nil
    end
  end

  def push(value)
    @head, @head.next = Node.new(value), head
    return head
  end

  def pop
    if head
      popped = head
      @head = head.next
      return popped
    else
      false
    end
  end

  def insert_after(value, node_value = nil)
      if node_value
        if head.value ==  node_value
          next_node = head.next
          @head.next = Node.new(value)
          @head.next = next_node
        else
          current_node = head.next
          while current_node
            if current_node.value == node_value
              next_node = current_node.next
              current_node.next = Node.new(value)
              current_node.next.next = next_node
            end
            current_node = current_node.next
          end
          false
        end
      else
        push(value)
      end
  end

  def insert_before(value)
  end

  def nth_from_head(n, current_node = head, count = 0)
    return head if n == 0
    return current_node if count == n
    return false if current_node.next == nil
    nth_from_head(n, current_node.next, count + 1)
  end

  def nth_to_last(n)
    nth_from_current = nth_from_head(n)
    current_node = head
    while nth_from_current.next != nil
      current_node, nth_from_current = current_node.next, nth_from_current.next
    end
    current_node
  end

  def reverse!
    current_node = head
    cache_1 = current_node.next
    cache_2 = cache_1.next
    current_node.next = nil # reverse
    while cache_2
      cache_1.next = current_node # reverse
      current_node = cache_1
      cache_1, cache_2 = cache_2, cache_2.next
    end
    cache_1.next = current_node # reverse
    @head = cache_1
  end

  def show_list(current_node, msg = nil)
    msg ||= ""
    return msg[0..-4] if current_node.nil?
    show_list(current_node.next, msg << "#{current_node.value} -> ")
    # show_list(current_node.next, msg << "#{current_node.value} -> ")
  end
end

link = LinkedList.new
one = link.add(1)
# p link.head
link.add(2)
link.add(3)
link.add(4)
link.add(5)
# p link.head
# p link.show_list(one) == "1 -> 2 -> 3 -> 4 -> 5 "
# p "find three"
# p link.find(3)
link.remove(3)
# p link.remove(3)
# p link.show_list(link.head) == "1 -> 2 -> 4 -> 5 "
link.push(0)
# p link.show_list(link.head) #== "0 -> 1 -> 2 -> 4 -> 5 "
link.pop
link.show_list(link.head)
link.insert_after(3, 2)
# p link.show_list(link.head) == "1 -> 2 -> 3 -> 4 -> 5 "
# p link.insert_after(7, 6) == false
link.insert_after(0)
# p link.show_list(link.head) == "0 -> 1 -> 2 -> 3 -> 4 -> 5 "
# p link.nth_from_head(3) == 3
# p link.nth_from_head(5) == 5
# p link.nth_from_head(6) == false
link.add(6)
link.add(7)
link.add(8)
link.add(9)
# p link.show_list(link.head) == "0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9 "
# p link.nth_to_last(1).value == 8
link.reverse!
p link.show_list(link.head) #== "9 -> 8 -> 7 -> 6 -> 5 -> 4 -> 3 -> 2 -> 1 -> 0 "
