# Find first none repeating char
# Use true false as hash value to indicate whether a char is a repeat or not
# instead of using integers. CLEVER!

def first_repeat(string)
  lib = {}
  string.each_char do |c|
    if lib[c.to_sym] == nil
      lib[c.to_sym] = false
    elsif lib[c.to_sym] == false
      lib[c.to_sym] = true
    end
  end
end

s = "teeter"
first_repeat(s)
