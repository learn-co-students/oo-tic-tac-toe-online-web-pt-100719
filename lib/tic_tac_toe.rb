require 'pry'

class TicTacToe
  
  def initialize
    @board = Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], #Top Row 
    [3,4,5], #Middle Row 
    [6,7,8], #Bottom Row
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
   def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end 
  
  def move(index,token = X)
  @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " "? false : true  
  end 
  
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "please enter a value from 1 to 9:"
    input = gets 
    index = input_to_index(input)
    #p = current_player
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
   end
 
 def won?
  WIN_COMBINATIONS.find do 
    |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
    end
  end
  
  def full?
  @board.all?{|occupied| occupied != " "}
end

#draw
def draw?
  !(won?) && (full?)
end

#over?
def over?
  won? || full? || draw?
end

#winner?
def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end

 
 
 def play
  # puts "Please make a move! :)"
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
 end
end

