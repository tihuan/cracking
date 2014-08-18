# Naive Fib is exponential run time

# Dynamic Programming w/ library is linear
# DP is eseentially guessing + memoization + recursion

# Buttom Up DP w/ library is also linear but has the benefit of
# using less memory because you only need to track the last two
# values in your library

# Optimization: #bup_fib_1 > #bup_fib. #fav_fib is the fastest but hits
# stack too deep earlier.

# Recommendation is #bup_fib_1

require 'benchmark'

def naive_fib(n)
  return 1 if n <= 2
  f = naive_fib(n-1) + naive_fib(n-2)
end

def dp_fib(n, fib=[])
  # p "BEGINNNN"
  # p "show fib(#{n}): #{fib}"
  if fib[n]
    # p "returning value.. for #{n}: #{fib[n]}"
    return fib[n]
  end
  return 1 if n <= 2
  # p "calculating for #{n}:: fib(#{n-2}) + fib(#{n-1})"
  f = dp_fib(n-2, fib) + dp_fib(n-1, fib)
  # p "done! fib(#{n}) is: #{f}"
  fib[n] = f
  # p "fib(#{n}) at the end: #{fib}"
  # f
end

def bup_fib(n)
  fib = []
  for k in 1..(n)
    if k <= 2
      f = 1
    else
      f = fib[k-1] + fib[k-2]
    end
    fib[k] = f
  end
  return fib[n]
end

# Refactored to only keep track of the last two numbers.

def bup_fib_1(n)
  fibs = []
  0.upto(n) do |i|
    if i <= 2
      f = 1
    else
      f = fibs[-2] + fibs[-1]
    end
    fibs = fibs.last(2) if fibs.size > 2
    fibs << f
  end
  fibs.last
end

# recursive with invariants
def fav_fib(n, count = 1, current = 1, next_num = 1)
  return 1 if n <= 2
  return current if count == n
  return fav_fib(n, count + 1, next_num, current + next_num)
end


# def fav_fib(n, count = 0, current_num = 0, next_num = 1)
#   return 1 if n <= 2
#   return current_num if n == count
#   return fav_fib(n, count + 1, next_num, current_num + next_num)
# end

##### Naive Fib Tests

# p naive_fib(1) == 1
# p naive_fib(2) == 1
# p naive_fib(3) == 2
# p naive_fib(4) == 3
# p naive_fib(5) == 5
# p naive_fib(6) == 8

##### Dynamic Programming Tests

# p dp_fib(1) == 1
# p dp_fib(2) == 1
# p dp_fib(3) == 2
# p dp_fib(4) == 3
# p dp_fib(5) == 5
# p dp_fib(6) == 8
# p dp_fib(10) == 55

##### Bottom Up Dynamic Programming Tests

# p bup_fib(1) == 1
# p bup_fib(2) == 1
# p bup_fib(3) == 2
# p bup_fib(4) == 3
# p bup_fib(5) == 5
# p bup_fib(6) == 8
# p bup_fib(10) #== 55
# p bup_fib(200000) #== 55

##### Bottom Up Dynamic Programming Tests

# p bup_fib_1(1) == 1
# p bup_fib_1(2) == 1
# p bup_fib_1(3) == 2
# p bup_fib_1(4) == 3
# p bup_fib_1(5) == 5
# p bup_fib_1(6) == 8
# p bup_fib_1(10) #== 55

##### Favorite Solution Tests

p fav_fib(1) == 1
p fav_fib(2) == 1
p fav_fib(3) == 2
p fav_fib(4) == 3
p fav_fib(5) == 5
p fav_fib(6) == 8
p fav_fib(10) #== 55
n = 400000
# puts Benchmark.measure { naive_fib(n) }
# puts "dp"
# puts Benchmark.measure { dp_fib(n) } # up to 16373 before too deep
# puts "fav"
# puts Benchmark.measure { fav_fib(n) } # up to 7704 before too deep. Faster though
# puts "bup"
# puts Benchmark.measure { bup_fib_1(n) } # up to 7704 before too deep. Faster though
# puts Benchmark.measure { bup_fib(n) } # up to 7704 before too deep. Faster though
