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
    puts "#{current_player} please enter a value from 1 to 9:"
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
end
