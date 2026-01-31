# Leetcode link: https://leetcode.com/problems/can-place-flowers/?envType=study-plan-v2&envId=leetcode-75

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  for i in 0..flowerbed.length - 1
    if flowerbed[i] == 0 && ((flowerbed[i + 1] == 0 && flowerbed[i - 1] == 0) || (i == 0 && flowerbed[i + 1] == 0) || (i == flowerbed.length - 1 && flowerbed [i - 1] == 0))
      flowerbed[i] = 1
      n -= 1
    end
  end

  puts flowerbed
  n <= 0
end

puts can_place_flowers([0, 0, 1, 0, 0], 1)
