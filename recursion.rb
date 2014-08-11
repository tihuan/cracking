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

p factorial(5) == 120
p factorial_iterative(5) == 120
n = 8700
puts Benchmark.measure { factorial(n) }
puts Benchmark.measure { factorial_iterative(n) }
