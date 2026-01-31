# Leetcode link: https://leetcode.com/problems/evaluate-reverse-polish-notation/submissions/1901875449/?envType=problem-list-v2&envId=dsa-linear-shoal-stack

# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []
  operands = ['+', '-', '*', '/']
  tokens.each do |tk|
    if operands.include?(tk)
      b = stack.pop.to_i
      a = stack.pop.to_i

      result =
        case tk
        when '+'
          a + b
        when '-'
          a - b
        when '*'
          a * b
        when '/'
          # truncate toward zero
          (a.to_f / b).truncate
        end

      stack.push(result)
    else
      stack.push(tk.to_i)
    end
  end

  stack.pop
end

puts eval_rpn(['10', '6', '9', '3', '+', '-11', '*', '/', '*', '17', '+', '5', '+'])
