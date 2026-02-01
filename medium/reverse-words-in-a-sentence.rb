# Leetcode link: https://leetcode.com/problems/reverse-words-in-a-string/?envType=study-plan-v2&envId=leetcode-75

# @param {String} s
# @return {String}
def reverse_words(s)
  char_array = s.split(' ')
  resp = []

  i = char_array.length - 1
  while i >= 0
    resp.append(char_array[i])
    i -= 1
  end

  resp.join(' ')
end

puts reverse_words('a good   example')
