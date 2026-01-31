# Leetcode link: https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/?envType=study-plan-v2&envId=leetcode-75

# @param {Integer[]} candies
# @param {Integer} extra_candies
# @return {Boolean[]}
def kids_with_candies(candies, extra_candies)
  highest = 0
  result = []
  candies.each do |candy|
    highest = candy if candy > highest
  end

  candies.each do |candy|
    if highest <= candy + extra_candies
      result.append(true)
    else
      result.append(false)
    end
  end

  puts result
end

puts kids_with_candies([2, 3, 5, 1, 3], 3)
