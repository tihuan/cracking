def selection_sort(array)
  0.upto(array.size) do |i|
    min = i
     (i + 1).upto(array.size - 1) do |j|
        min = j if array[j] < array[min]
     end
     array[i], array[min] = array[min], array[i] if i < min
  end
  return array
end

# def quick_sort(array, lower = 0, upper = array.size - 1)
#   p "===entering quick sort==="
#   p "begin array: #{array}"
#   p "lower: #{lower}"
#   p "upper: #{upper}"
#   pivot_value = array[(lower + upper) / 2]
#   p "pivot_index: #{(lower + upper) / 2}, pivot_value: #{pivot_value}"
#   i = lower
#   j = upper

#   while i <= j
#     p "i: #{i}, j: #{j}"
#     i += 1 while array[i] < pivot_value
#     j -= 1 while array[j] > pivot_value
#     if i <= j
#       p "before swapping array: #{array}"
#       p "i: #{i} - value: #{array[i]}, j: #{j} - value: #{array[j]}"
#       array[i], array[j] = array[j], array[i] if i < j
#       i += 1
#       j -=1
#       p "while loop array: #{array}"
#     end
#     p "ending i: #{i}, j: #{j}"
#   end
#   quick_sort(array, lower, j) if lower < j
#   quick_sort(array, i, upper) if i < upper
#   p "After loop array: #{array}"
#   array
# end

def quick_sort(array, lower = 0, upper = array.size - 1)
  i = lower
  j = upper
  pivot = (lower + upper) / 2
  pivot_value = array[pivot]
  i += 1 while array[i] < pivot_value
  j -= 1 while array[j] > pivot_value
  if i <= j
    array[i], array[j] = array[j], array[i] if i < j
    i += 1
    j -=1
  end
  quick_sort(array, lower, j) if lower < j
  quick_sort(array, i, upper) if upper > i
  array
end

# Insertion sort: Elements are inserted sequentially into the right position.
# Requirements: Needs to be able to compare elements with <=>, and the [] []= methods should
# be implemented for the container.
# Time Complexity: О(n^2)
# Space Complexity: О(n) total, O(1) auxiliary
# Stable: Yes
#
# Algorithms::Sort.insertion_sort [5, 4, 3, 1, 2] => [1, 2, 3, 4, 5]
def insertion_sort(container)
  return container if container.size < 2
  (1..container.size-1).each do |i|
    value = container[i]
    j = i-1
    while j >= 0 and container[j] > value do
      container[j+1] = container[j]
      j = j-1
    end
    container[j+1] = value
  end
  container
end

array = [1,10,2,9,3,8,4,7,5,6]
# array = [1,6,2,9,3,8,4,7,5,10]
# array = [1,6,2,5,3,8,4,7,9,10]
# p selection_sort(array) == array.sort
p quick_sort(array) == array.sort


