# Find first none repeating char
# Use true false as hash value to indicate whether a char is a repeat or not
# instead of using integers. CLEVER!

def first_repeat(string)
  lib = {}
  string.each_char do |c|
    # care if value is already true
    if lib[c.to_sym] == nil
      lib[c.to_sym] = false
    elsif lib[c.to_sym] == false
      lib[c.to_sym] = true
    end
  end
  string.each_char do |c|
    return c if lib[c.to_sym] == false
  end
  return false # if all chars are repeated
end

def delete_words(target, source)
  libs = {}
  processed_string = ""
  source.each_char do |c|
    libs[c.to_sym] = true
  end
  target.each_char do |c|
    processed_string << c unless libs[c.to_sym] == true
  end
  processed_string
end

def reverse(string)
  traverse_length = (string.size / 2).ceil - 1
  for i in 0..traverse_length
    string[i], string[-1-i] = string[-1-i], string[i]
  end
  string
end

# s = "teeter"
# p first_repeat(s) == "r"

# s = "total"
# p first_repeat(s) == "o"

# t = "Battle of the Vowels: Hawaii vs. Grozny"
# s = "aeiou"
# p delete_words(t, s) == "Bttl f th Vwls: Hw vs. Grzny"

s = "123456"
p reverse(s) == "654321"

s = "12345"
p reverse(s) == "54321"
