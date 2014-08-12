def selection_sort(array)
  array.each_with_index do |value, index|
    min = index
    for i in (index + 1)..(array.size - 1)
      min = i if array[i] < array[min]
    end
    unless index > min
      array[index], array[min] = array[min], array[index]
    end
  end
  array
end

array = [3,4,1,2,5,1,2,7,8,5,13,1,1,1,3,1]
p selection_sort(array) == array.sort
