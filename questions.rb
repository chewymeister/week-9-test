require 'open-uri'

# keep only the elements that start with an a
def select_elements_starting_with_a(array)
  array.select do |item|
    item.chars.shift == "a"
  end
end

# keep only the elements that start with a vowel
def select_elements_starting_with_vowel(array)
  vowels = ['a','e','i','o','u']
  array.select do |item|
    vowels.include? item.chars.shift
  end
end

# remove instances of nil (but NOT false) from an array
def remove_nils_from_array(array)
  array.reject do |item|
    item.is_a? NilClass
  end
end

# remove instances of nil AND false from an array
def remove_nils_and_false_from_array(array)
  array.reject do |item|
    (item.is_a?(FalseClass) || item.is_a?(NilClass))
  end
end

# don't reverse the array, but reverse every word inside it. e.g.
# ['dog', 'monkey'] becomes ['god', 'yeknom']
def reverse_every_element_in_array(array)
  array.map do |word|
    word.reverse
  end
end

# given an array of student names, like ['Bob', 'Dave', 'Clive']
# give every possible pairing - in this case:
# [['Bob', 'Clive'], ['Bob', 'Dave'], ['Clive', 'Dave']]
# make sure you don't have the same pairing twice, 
def every_possible_pairing_of_students(array)
  array.map do |pair|
    array.select do |name|
      name != pair
    end
  end

end

# discard the first 3 elements of an array, 
# e.g. [1, 2, 3, 4, 5, 6] becomes [4, 5, 6]
def all_elements_except_first_3(array)
  array[3..-1]
end

# add an element to the beginning of an array
def add_element_to_beginning_of_array(array, element)
  array.insert 0, element
end

# sort an array of words by their last letter, e.g.
# ['sky', 'puma', 'maker'] becomes ['puma', 'maker', 'sky']
def array_sort_by_last_letter_of_word(array)
  array.sort_by do |word|
    word.chars[-1]
  end
end

# cut strings in half, and return the first half, e.g.
# 'banana' becomes 'ban'. If the string is an odd number of letters
# round up - so 'apple' becomes 'app'
def get_first_half_of_string(string)
  array = string.chars
  if array.count.even?
    array[0..(array.count/2 - 1)].join
  elsif array.count.odd?
    array[0..(array.count/2)].join
  end
end

# turn a positive integer into a negative integer. A negative integer
# stays negative
def make_numbers_negative(number)
  if number < 0
    number
  else
    number * -1
  end
end

# turn an array of numbers into two arrays of numbers, one an array of 
# even numbers, the other an array of odd numbers
# even numbers come first
# so [1, 2, 3, 4, 5, 6] becomes [[2, 4, 6], [1, 3, 5]]
def separate_array_into_even_and_odd_numbers(array)
  new_array = []
  new_array << array.select(&:even?)
  new_array << array.select(&:odd?)
  new_array
end

# count the numbers of elements in an element which are palindromes
# a palindrome is a word that's the same backwards as forward
# e.g. 'bob'. So in the array ['bob', 'radar', 'eat'], there
# are 2 palindromes (bob and radar), so the method should return 2
def number_of_elements_that_are_palindromes(array)
  array.select do |word|
    word == word.reverse
  end.count
end

# return the shortest word in an array
def shortest_word_in_array(array)
  array.sort_by(&:length).shift
end

# return the shortest word in an array
def longest_word_in_array(array)
  array.sort_by(&:length).pop
end

# add up all the numbers in an array, so [1, 3, 5, 6]
# returns 15
def total_of_array(array)
  array.inject {|sum, n| sum + n}
end

# turn an array into itself repeated twice. So [1, 2, 3]
# becomes [1, 2, 3, 1, 2, 3]
def double_array(array)
  array += array
end

# convert a symbol into a string
def turn_symbol_into_string(symbol)
  if symbol.is_a? String
    symbol
  else
    symbol.to_s
  end
end

# get the average from an array, rounded to the nearest integer
# so [10, 15, 25] should return 33
def average_of_array(array)
  total = array.inject {|sum, n| sum + n}
  average = total/array.count.to_f
  average.round
end

# get all the elements in an array, up until the first element
# which is greater than five. e.g.
# [1, 3, 5, 4, 1, 2, 6, 2, 1, 3, 7]
# becomes [1, 3, 5, 4, 1, 2]
def get_elements_until_greater_than_five(array)
  array.take_while{ |num| num < 6 }
end

# turn an array (with an even number of elements) into a hash, by
# pairing up elements. e.g. ['a', 'b', 'c', 'd'] becomes
# {'a' => 'b', 'c' => 'd'}
def convert_array_to_a_hash(array)
  hash = {}
  array.each_slice(2) do |slice|
    hash[slice[0]] = slice[1]
  end
  hash
end

# get all the letters used in an array of words and return
# it as a array of letters, in alphabetical order
# . e.g. the array ['cat', 'dog', 'fish'] becomes
# ['a', 'c', 'd', 'f', 'g', 'h', 'i', 'o', 's', 't']
def get_all_letters_in_array_of_words(array)
  array.map(&:chars).flatten.sort
end

# swap the keys and values in a hash. e.g.
# {'a' => 'b', 'c' => 'd'} becomes
# {'b' => 'a', 'd' => 'c'}
def swap_keys_and_values_in_a_hash(hash)
  hash_new = {}
  hash.map do |key, value|
    hash_new[value] = key
  end
  hash_new
end

# in a hash where the keys and values are all numbers
# add all the keys and all the values together, e.g.
# {1 => 1, 2 => 2} becomes 6
def add_together_keys_and_values(hash)
  hash.map do |key, value|
    key + value
  end.inject {|sum, n| sum + n}
end

# take out all the capital letters from a string
# so 'Hello JohnDoe' becomes 'ello ohnoe'
def remove_capital_letters_from_string(string)
  string.chars.reject do |letter|
    letter.codepoints[0].between? 65,90
  end.join
end

# round up a float up and convert it to an Integer,
# so 3.214 becomes 4
def round_up_number(float)
  float.ceil
end

# round down a float up and convert it to an Integer,
# so 9.52 becomes 9
def round_down_number(float)
  float.floor
end

# take a date and format it like dd/mm/yyyy, so Halloween 2013
# becomes 31/10/2013
def format_date_nicely(date)
  "#{date.day}/#{date.month}/#{date.year}"
end

# get the domain name *without* the .com part, from an email address
# so alex@makersacademy.com becomes makersacademy
def get_domain_name_from_email_address(email)
  email.scan(/(?<=\@)(.*?)(?=\.)/).flatten[0]
end

# capitalize the first letter in each word of a string, 
#  except 'a', 'and' and 'the'
# *unless* they come at the start of the start of the string, e.g.
# 'the lion the witch and the wardrobe' becomes
# 'The Lion the Witch and the Wardrobe'
def titleize_a_string(string)
  word_list = string.split
  new_word_list = word_list.map do |word|
    if (word == 'and') || (word == 'the')
      word + ' '
    else
      word.capitalize + ' '
    end
  end
  new_word_list.first.capitalize!
  new_word_list.last.strip!
  new_word_list.join
end

# return true if a string contains any special characters
# where 'special character' means anything apart from the letters
# a-z (uppercase and lower) or numbers
def check_a_string_for_special_characters(string)
  !(string =~ /^[a-zA-Z0-9_.-]*$/)
end

# get the upper limit of a range. e.g. for the range 1..20, you
# should return 20
def get_upper_limit_of(range)
  range.max
end

# should return true for a 3 dot range like 1...20, false for a 
# normal 2 dot range
def is_a_3_dot_range?(range)
  !range.include? range.last
end

# get the square root of a number
def square_root_of(number)
  Math.sqrt number
end

# count the number of words in a file
def word_count_a_file(file_path)
  content = File.open(file_path).read
  content.split.count
end

# --- tougher ones ---

# call an arbitrary method from a string. so if I
# called call_method_from_string('foobar')
# the method foobar should be invoked
def call_method_from_string(str_method)
  send('str_method')
end

# return true if the date is a uk bank holiday for 2014
# the list of bank holidays is here:
# https://www.gov.uk/bank-holidays
def is_a_2014_bank_holiday?(date)
  content = File.open('dates.txt').read
  formatted_date = date.strftime("%A %-d %B")
  content.include? formatted_date
  # content
end

# given your birthday this year, this method tells you
# the next year when your birthday will fall on a friday
# e.g. january 1st, will next be a friday in 2016
# return the day as a capitalized string like 'Friday'
def your_birthday_is_on_a_friday_in_the_year(birthday)
  @date = Date.parse birthday.to_s
  @formatted_date = @date.strftime("%A")
  until @formatted_date == "Friday"
    @date = @date.next_year
    @formatted_date = @date.strftime("%A")
  end
  @date.year
end

# in a file, total the number of times words of different lengths
# appear. So in a file with the text "the cat sat on the blue mat"
# I have 5 words which are 3 letters long, 1 which is 2 letters long
# and 1 that is 4 letters long. Return it as a hash in the format
# word_length => count, e.g. {2 => 1, 3 => 5, 4 => 1}
def count_words_of_each_length_in_a_file(file_path)
  content = File.open(file_path).read
  # new_content = content.split.select do |word|
  #   word =~ /[\W]/
  # end
  new_content = content.gsub(/[,.]/, '')
  word_list = new_content.split
  # word_list = new_content.split
  # word_list = content.split(' ')
  # word_list
  # new_content
  @hash = Hash.new(0)
  word_list.each do |word|
    @hash[word.length] = @hash[word.length] += 1
  end
  @hash
  # @hash.inject {|sum, key, value|}
end

# implement fizzbuzz without modulo, i.e. the % method
# go from 1 to 100
# (there's no RSpec test for this one)


def is_divisible_by_3? number
    factor = number/3
    number - (3*factor) == 0
end
def is_divisible_by_5? number
  factor = number/5
  number - (5*factor) == 0
end
def is_divisible_by_15? number
  (is_divisible_by_3?(number)) && (is_divisible_by_5?(number))
end

def fizzbuzz number
  if is_divisible_by_15? number
    'FizzBuzz'
  elsif is_divisible_by_5? number
    'Buzz'
  elsif is_divisible_by_3? number
    'Fizz'
  else
    number
  end
end

# print the lyrics of the song 99 bottles of beer on the wall
# http://www.99-bottles-of-beer.net/lyrics.html
# make sure you use the singular when you have one bottle of 
# beer on the wall, and print 'no more bottles of beer on the wall'
# at the end.
# (there's no RSpec test for this one)
def ninety_nine_bottles_of_beer
  n = 99
while n <= 99

  print "#{n} Bottles of beer on the wall, #{n} bottles of beer. \n"
  n -= 1 
  print "Take one down, pass it around, #{n} bottles of beer on the wall"
  if n == 0
    "No more bottles of beer on the wall, no more bottles of beer. \n
Go to the store and buy some more, 99 bottles of beer on the wall."
  end
end