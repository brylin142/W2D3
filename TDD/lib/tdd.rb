# require 'rspec'

def my_uniq(arr)
  non_duplicates = []
  arr.each do |el|
    non_duplicates << el unless non_duplicates.include?(el)
  end
  non_duplicates
end
