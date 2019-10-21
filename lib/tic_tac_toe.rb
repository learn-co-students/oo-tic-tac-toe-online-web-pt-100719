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
  
=begin  def turn
    puts "Pick a number 1-9"
    input = gets.chomp
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
=end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

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
end