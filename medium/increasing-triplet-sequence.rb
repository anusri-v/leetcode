# Leetcode link: https://leetcode.com/problems/increasing-triplet-subsequence/?envType=study-plan-v2&envId=leetcode-75

# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  i = 0
  j = 1
  k = 2

  while k < nums.length
    return true if nums [i] < nums[j] && nums[j] < nums[k]

    i += 1
    j += 1
    k += 1
  end

  false
end

puts increasing_triplet([20, 100, 10, 12, 5, 13])
