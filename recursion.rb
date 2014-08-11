require 'benchmark'

def factorial(n)
  return 1 if n <= 1
  n * factorial(n-1)
end

def factorial_iterative(n)
  return 1 if n <= 1
  answer = 1
  for i in 1..n
    answer *= i
  end
  answer
end

def b_search_index(nums, target, lower = 0, upper = nums.size - 1)
  # use range + lower instead of lower + upper
  range = (upper - lower) / 2
  center = range + lower
  return false if range == 0 && nums[lower] != target
  if target == nums[center]
    center
  elsif target <  nums[center]
    # center - 1 to avoid double counting
    b_search_index(nums, target, lower, center - 1)
  else
    # center + 1 to avoid double counting
    b_search_index(nums, target, center + 1, upper)
  end
end

def bsearch_iterative(nums, target)
  lower = 0
  upper = nums.size - 1
  while true
    range = (upper - lower) / 2
    center = range + lower
    return false if range == 0 && nums[lower] != target
    if nums[center] == target
      return center
    elsif nums[center] > target
      upper = center - 1
    else
      lower = center + 1
    end
  end
end

# p factorial(5) == 120
# p factorial_iterative(5) == 120
# n = 8700
# puts Benchmark.measure { factorial(n) }
# puts Benchmark.measure { factorial_iterative(n) }

nums = [1,2,3,4,5,6,7]
# p b_search_index(nums, 4) == 3
# p b_search_index(nums, 7) == 6
# p b_search_index(nums, 1) == 0
# p b_search_index(nums, 8) == false

p bsearch_iterative(nums, 4) == 3
p bsearch_iterative(nums, 7) == 6
p bsearch_iterative(nums, 1) == 0
p bsearch_iterative(nums, 8) == false

