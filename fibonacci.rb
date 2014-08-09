# Naive Fib is exponential run time

# Dynamic Programming w/ library is linear
# DP is eseentially guessing + memoization + recursion

# Buttom Up DP w/ library is also linear but has the benefit of
# using less memory because you only need to track the last two
# values in your library

def naive_fib(n)
  return 1 if n <= 2
  f = naive_fib(n-1) + naive_fib(n-2)
end

def dp_fib(n)
end

def bup_fib(n)
end

##### Naive Fib Tests

p naive_fib(1) == 1
p naive_fib(2) == 1
p naive_fib(3) == 2
p naive_fib(4) == 3
p naive_fib(5) == 5
p naive_fib(6) == 8

##### Dynamic Programming Tests

