Programs
==================count consicutive letters in string ==========================

def count_consicutive(input)
  result = ''
  count = 1

  (1..input.length).each do |i|
    if input[i] == input[i -1]
      count +=1
    else
      result += input[i - 1]
      result += count > 1 ? count.to_s : ''
      count = 1
    end
  end
  result
end

input = "aaabbcddaaaaa"

output =  a3b2cd2a5

============================sort_array withount inbuild function ====================================================

def sort_array(arr)
  loop do
    swapped = false

    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end

    break unless swapped
  end

  arr
end
===========================find max from array withoutn function =======================

def max(arr)
  max = arr[0]
  arr.each do |n|
    if n > max
      max = n
    end
  end
  return max
end

=================================find second largest from array =============================================
def second_large(arr)
  return if arr.length < 1

  max = arr[0]
  second = nil

  arr.each do |num|
    if num > max
      second = max
      max = num
    elsif num < max &&(second.nil? || second < num)
      second = num
    end
  end
  return second
end

=============================================Count Occurrences of Each Element in an Array=========


def count_occurrences(arr)
  result = {}

  arr.each do |element|
    if result[element]
      result[element] += 1
    else
      result[element] = 1
    end
  end

  result
end

puts count_occurrences([1, 2, 2, 3, 3, 3, 4]).inspect


============================================reverse array without function =====

def reverse_array(arr)
  reversed = []
  (arr.length - 1).downto(0) do |i|
    reversed << arr[i]
  end
  reversed
end

puts reverse_array([1, 2, 3, 4, 5]).inspect
# Output: [5, 4, 3, 2, 1]
========================find duplicate ==================================================================

def find_duplicates(arr)
  duplicates = []
  arr.each_with_index do |element, index|
    if arr.index(element) != index && !duplicates.include?(element)
      duplicates << element
    end
  end
  duplicates
end

puts find_duplicates([1, 2, 3, 2, 4, 4, 5]).inspect


======================================= Find Unique Elements Without Using uniq====================================

def unique_elements(arr)
  result = []
  arr.each do |element|
    unless result.include?(element)
      result << element
    end
  end
  result
end

puts unique_elements([1, 2, 2, 3, 4, 4, 5]).inspect


=================================================Convert Array of Arrays to Hash === =========================

def array_to_hash(arr)
  result = {}

  arr.each do |key, value|
    result[key] = value
  end

  result
end

puts array_to_hash([[:a, 1], [:b, 2], [:c, 3]]).inspe
