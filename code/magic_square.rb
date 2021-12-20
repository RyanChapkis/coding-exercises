class MagicSquare
  # Implement a method that takes a 2D array, 
  # checks if it's a magic square and returns either true or false depending on the result.
  # sequence (https://en.wikipedia.org/wiki/Magic_square)
  def self.validate(square)
    side_size = square.length
    prime_diagonal_sum = 0

    for i in 0...side_size
      prime_diagonal_sum = prime_diagonal_sum + square[i][i]
    end

    #verify all row sums are equal to prime diagonal sum
    for i in 0...side_size
      row_sum = 0
      for j in 0...side_size
        row_sum += square[i][j]
      end
      if row_sum != prime_diagonal_sum
        puts "This is not a magic square."
        return false
      end 
    end

    #verify all column sums are equal to prime diagonal sum
    for i in 0...side_size
      col_sum = 0
      for j in 0...side_size
        col_sum += square[j][i]
      end  
      if prime_diagonal_sum != col_sum
        puts "This is not a magic square."
        return false
      end  
    end  
    puts "This IS a magic square"
    return true

  end
end