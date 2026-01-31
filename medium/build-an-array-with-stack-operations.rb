# Leetcode link: https://leetcode.com/problems/build-an-array-with-stack-operations/description/?envType=problem-list-v2&envId=dsa-linear-shoal-stack

# @param {Integer[]} target
# @param {Integer} n
# @return {String[]}
def build_array(target, n)
  result = []
  answer = []
  ptr = 0
  i = 0

  while ptr < target.length && i <= n
    if target[ptr] != result[ptr] && result[ptr].nil?
      i += 1
      result.push(i)
      answer.push('Push')
    elsif target[ptr] != result[ptr] && !result[ptr].nil?
      result.pop
      answer.push('Pop')
    elsif target[ptr] == result[ptr]
      ptr += 1
    end
  end

  answer
end

puts build_array([1, 3], 3)
