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

def insertionsort(array)
  return array if array.size <= 1
  0.upto(array.size-1) do |i|
    j = i - 1
    while j >= 0 && array[j] > array[i]
      array[i], array[j] = array[j], array[i]
      i -= 1
      j -= 1
    end
  end
  array
end

 # Mergesort: A stable divide-and-conquer sort that sorts small chunks of the container and then merges them together.
# Returns an array of the sorted elements.
# Requirements: Container should implement []
# Time Complexity: О(n log n) average and worst-case
# Space Complexity: О(n) auxiliary
# Stable: Yes
#
# Algorithms::Sort.mergesort [5, 4, 3, 1, 2] => [1, 2, 3, 4, 5]

def mergesort(array)
  return array if array.size <= 1
  mid = array.size / 2
  left = array[0...mid]
  right = array[mid...array.size]
  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    left.first <= right.first ? sorted << left.shift : sorted << right.shift
  end
  sorted + left + right
end

array = [1,10,2,9,3,8,4,7,5,6]
# array = [1,6,2,9,3,8,4,7,5,10]
# array = [1,6,2,5,3,8,4,7,9,10]
# p selection_sort(array) == array.sort
# p quick_sort(array) == array.sort
# p mergesort(array) == array.sort
# p insertionsort(array) == array.sort


