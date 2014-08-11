def factorial(n)
  return 1 if n == 1
  n * factorial(n-1)
end

def factorial_iterative(n)
  answer = 1
  for i in 1..n
    answer *= i
  end
  answer
end

p factorial(5) == 120
p factorial_iterative(5) == 120