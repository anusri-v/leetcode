# Leetcode link: https://leetcode.com/problems/reverse-vowels-of-a-string/description/?envType=study-plan-v2&envId=leetcode-75

# @param {String} s
# @return {String}
def reverse_vowels(s)
  char_array = s.chars
  vowels = %w[a e i o u]

  left = 0
  right = char_array.length - 1

  while left < right
    if !vowels.include?(char_array[left].downcase)
      left += 1
    elsif !vowels.include?(char_array[right].downcase)
      right -= 1
    else
      char_array[left], char_array[right] = char_array[right], char_array[left]
      left += 1
      right -= 1
    end
  end

  char_array.join
end

puts reverse_vowels('leetcode')
