def selection_sort(array)
  array.each_with_index do |_, index|
    min = index
    lower = index + 1
    upper = array.size - 1
    for i in lower..upper
      min = i if array[i] < array[min]
    end
    if index < min
      array[index], array[min] = array[min], array[index]
    end
  end
  array
end

array = [3,4,1,2,5,1,2,7,8,5,13,1,1,1,3,1]
p selection_sort(array) == array.sort


