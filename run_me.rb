# frozen_string_literal: true

require 'prime'

PROB5_NO_TRICKS = [8, 7, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].freeze

def full_divided?(num)
  digits = num.digits
  return false unless (digits.sum % 3).zero?
  PROB5_NO_TRICKS.each { |i| return false unless (num % i).zero? }
  true
end

def prob5
  n = 10
  loop do
    break if full_divided?(n)
    n += 10 # all even integers
  end
  n # { result: 232792560, time: 14.01 seconds }
end

def prob4
  ref     = 999
  result  = 0
  ref.downto(0).each do |num1|
    ref.downto(0) do |num2|
      tmp     = num1 * num2
      result  = tmp if (tmp.to_s == tmp.to_s.reverse) && (tmp > result)
    end
  end
  result # { result: 906609, time: 0.32 seconds }
end

def parse_primes(ref)
  Prime.each { |prime| return ref / prime if (ref % prime).zero? }
end

def prob3
  ref       = 600_851_475_143
  remainder = ref
  remainder = parse_primes(remainder) until Prime.prime?(remainder)
  remainder # { result: 6857, time: 0.0 seconds }
end

def prob2
  ref     = 4_000_000
  numbers = [1, 2]
  res     = [2]
  i       = 2
  loop do
    new_num = (numbers[i - 1] + numbers[i - 2])
    break if new_num > ref
    numbers << new_num
    res << new_num if new_num.even?
    i += 1
  end
  res.sum # { result: 4613732, time: 0.0 seconds }
end

def prob1
  p '404 - no code here'
end

def show_time(start_at)
  timing = (Time.now - start_at).round(2)
  if timing > 60 * 2
    ((Time.now - start_at) % 60).to_s + ' minutes'
  else
    timing.to_s + ' seconds'
  end
end

def add_few_lines
  p 'lol'
end

if ARGV.any?
  prob_num = ARGV[0]
else
  puts 'Problem number?'
  prob_num = gets.chomp
end

start_at  = Time.now
result    = send("prob#{prob_num}")
puts "{ result: #{result}, time: #{show_time(start_at)} }"
