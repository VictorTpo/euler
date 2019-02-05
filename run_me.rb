# frozen_string_literal: true

require 'prime'

def prob4
  ref     = 999
  result  = 0
  ref.downto(0).each do |num1|
    ref.downto(0) do |num2|
      tmp     = num1 * num2
      result  = tmp if (tmp.to_s == tmp.to_s.reverse) && (tmp > result)
    end
  end
  result
end

def parse_primes(ref)
  Prime.each { |prime| return ref / prime if (ref % prime).zero? }
end

def prob3
  ref       = 600_851_475_143
  remainder = ref
  remainder = parse_primes(remainder) until Prime.prime?(remainder)
  remainder
end

def prob2
  ref     = 4_000_000
  numbers = [1, 2]
  res     = [2]
  i       = 2
  while
    new_num = (numbers[i - 1] + numbers[i - 2])
    break if new_num > ref
    numbers << new_num
    res << new_num if new_num.even?
    i += 1
  end
  res.sum
end

def prob1
  p 'prob1!'
end

if ARGV.any?
  prob_num = ARGV[0]
else
  puts 'Problem number?'
  prob_num = gets.chomp
end

p send("prob#{prob_num}")
