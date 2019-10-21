require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
    ]
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end
  
  def valid_move?(index)
    (0..8).include?(index) && !position_taken?(index)
  end
  
  def turn_count
    count = 0
    @board.each do |position|
      position == "X" || position == "O" ? count += 1 : nil
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9: " 
    user_input = gets.chomp #Gets user input
    index = input_to_index(user_input) #Has user input converted to index value
    if valid_move?(index) #If the move is valid
      move(index, current_player) #Move current_player to index
      display_board #Display updated board
    else
      turn #If not valid move, run turn method again
    end
  end

# Iterate through win WIN_COMBINATIONS to find if "X", or "O" has got three in a row
  def won?
    WIN_COMBINATIONS.each do |win| 
      win_1 = @board[win[0]]
      win_2 = @board[win[1]]
      win_3 = @board[win[2]]
      if win_1 == "X" && win_2 == "X" && win_3 == "X"
        return win
      elsif win_1 == "O" && win_2 == "O" && win_3 == "O"
        return win
      end
    end
    return false
  end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  #If the full? or won? method returns true, return true, else return false
  def draw?
    !won? && full? ? true : false
  end
  #If the draw? or won? method returns true, return true, else return false
  def over?
    draw? || won? ? true : false
  end
  
  #Recycled the concept of the the won? method but replaced the return values with strings, and a nil outside the WIN_COMBINATIONS each method to return nil if nobody won.
  def winner
    WIN_COMBINATIONS.each do |win|
      win_1 = @board[win[0]]
      win_2 = @board[win[1]]
      win_3 = @board[win[2]]
      if win_1 == "X" && win_2 == "X" && win_3 == "X"
        return "X"
      elsif win_1 == "O" && win_2 == "O" && win_3 == "O"
        return "O"
      end
    end
    nil
  end
  
  def play
    while !over?
      turn
    end
    if winner === "X"
      puts "Congratulations X!"
    elsif winner === "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end