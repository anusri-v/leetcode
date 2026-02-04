# Leetcode link: https://leetcode.com/problems/product-of-array-except-self/description/?envType=study-plan-v2&envId=leetcode-75

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  result = [1]
  product = 1
  i = 1

  while i < nums.length
    product = nums[i - 1] * product
    result[i] = product
    i += 1
  end

  product = 1
  i = nums.length - 2
  while i >= 0
    product *= nums[i + 1]
    result[i] *= product
    i -= 1
  end

  result
end

puts product_except_self([-1, 1, 0, -3, 3])
