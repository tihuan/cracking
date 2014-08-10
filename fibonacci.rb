# Naive Fib is exponential run time

# Dynamic Programming w/ library is linear
# DP is eseentially guessing + memoization + recursion

# Buttom Up DP w/ library is also linear but has the benefit of
# using less memory because you only need to track the last two
# values in your library
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
  for k in 1..n
    if k <= 2
      f = 1
    else
      # p "checking fib inside else"
      # p fib
      # p "check fib[0]: #{fib[0]}"
      # p "check fib[1]: #{fib[1]}"
      f = fib[-2] + fib[-1]
      # p "check f: #{f}"
    end
    # p "updating last 2"
    fib = fib.last(2)

    fib << f
    # p "after update"
    # p fib
  end
  return fib[-1]
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

def bup_fib_1(n)
  fib = []
  for k in 1..n
    if k <= 2
      f = 1
    else
      f = fib[-2] + fib[-1]
    end
    fib = fib.last(2)
    fib << f
  end
  return fib[-1]
end

def fav_fib(n, count = 0, current_num = 0, next_num = 1)
  return 1 if n <= 2
  return current_num if n == count
  fav_fib(n, count + 1, next_num, current_num + next_num)
end

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

##### Favorite Solution Tests

# p fav_fib(1) == 1
# p fav_fib(2) == 1
# p fav_fib(3) == 2
# p fav_fib(4) == 3
# p fav_fib(5) == 5
# p fav_fib(6) == 8
# p fav_fib(10) #== 55
n = 300000
# puts Benchmark.measure { naive_fib(n) }
# puts "dp"
# puts Benchmark.measure { dp_fib(n) } # up to 16373 before too deep
# puts "fav"
# puts Benchmark.measure { fav_fib(n) } # up to 7704 before too deep. Faster though
# puts "bup"
puts Benchmark.measure { bup_fib(n) } # up to 7704 before too deep. Faster though
puts Benchmark.measure { bup_fib_1(n) } # up to 7704 before too deep. Faster though
