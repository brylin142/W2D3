# require 'rspec'

def my_uniq(arr)
  non_duplicates = []
  arr.each do |el|
    non_duplicates << el unless non_duplicates.include?(el)
  end
  non_duplicates
end

class Array
  def two_sum
    (0...length).to_a.combination(2).to_a.select { |x, y| self[x] + self[y] == 0 }
  end
end

def my_transpose(matrix)
  transpose = Array.new (matrix.length) { Array.new(matrix.length) }
  matrix.each_index do |i|
    matrix[i].each_index do |j|
      transpose[j][i] = matrix[i][j]
    end
  end
  transpose
end

def stock_picker(stocks)
  current_largest = 0
  result = []
  i = 0
  while i < stocks.length
    j = i+1
    while j < stocks.length
      if  (stocks[j] - stocks[i] )> current_largest
        result = [i,j]
        current_largest = stocks[j] - stocks[i]
      end
      j +=1
    end
    i += 1
  end
  result
end

class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(start_tower, end_tower)
    raise "invalid move" if towers[start_tower].empty?
    starting_disc, end_place = towers[start_tower].last, towers[end_tower].last
    if end_place.nil? || starting_disc < end_place
      towers[end_tower] << towers[start_tower].pop
    else
      raise "invalid move"
    end
    towers
  end

  def won?
    towers[0].empty? && towers[1].length == 3 || towers[2].length == 3 ? true : false
  end
end
