#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

#goal is array[1,2,3]
def sum_recur(array)
#for array = []
  return 0 if array == []

  first_el = array.shift
  recursive_call = sum_recur(array)
  first_el + recursive_call

end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

#start with ()[1,2,3], 2)
def includes?(array, target)
  #empty array does not contain object
  return false if array == []

  #start with array[3]
  value = array.shift #pluck off
  if value == target
    true #the recursive call is not made
  else
    includes?(array, target)
  end

end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.
#([2,1,1], 1)
def num_occur(array, target)
  return 0 if array == []
  #every element appears zero times
  dup_array = array.dup
  value = dup_array.shift
  #previous
  if value == target
    count = num_occur(dup_array, target) + 1 #return previous, add one
  else
    count = num_occur(dup_array, target) #return previous value
  end
  count #ensures count is used for prior calls

end


#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.
#[6,6]
def add_to_twelve?(array)
  return false if array.size <= 1
   #doesn't execute if false
  dup_array = array.dup
  if dup_array[0] + dup_array[1] == 12
    state = true #negate base condition
  else
    state = add_to_twelve?(dup_array.drop(1))
  end
  state
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.
#[1,2,4,5]
def sorted?(array)
#base case...can pluck values out of array?
  return true if array.size == 1 #true base case
  return false if array == []
  dup_array = array.dup
  if dup_array[0] <= dup_array[1]
    dup_array.shift
    condition = sorted?(dup_array)
  else
    condition = false #stop recursive calls, and also this will never execute if sorted
  end
  condition
end


#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)
#[12345]
def reverse(number)
  return number if number.to_s.length == 1 #1 is the last number to go
  number_array = number.to_s.split("")
  first_element = number_array.pop #ie 2 (from base)
  new_number = number_array.join("").to_i
  recursive_call = first_element.to_s + reverse(new_number).to_s #take advantage of string concat

  output_string = ""
  number = output_string + recursive_call
  number.to_i
end
