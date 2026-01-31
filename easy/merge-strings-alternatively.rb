# Leetcode link: https://leetcode.com/problems/merge-strings-alternately/?envType=study-plan-v2&envId=leetcode-75

# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2)
  char_arr1 = word1.split('')
  char_arr2 = word2.split('')

  i = 0
  result = ''
  while i < char_arr1.length || i < char_arr2.length
    result.concat(char_arr1[i]) unless char_arr1[i].nil?
    result.concat(char_arr2[i]) unless char_arr2[i].nil?
    i += 1
  end

  result
end

puts merge_alternately('abc', 'pqr')
