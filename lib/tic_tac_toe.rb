class TicTacToe

  # We begin by creating our initialize instance method.
  # This method passes in the argument of our board as an instance variable

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Sets our class constant for winning combinations of our Tic Tac Toe game
  # This is a nested array

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # Method which displays our board after input is received from the user

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Receives input from the user and subtracts the value by one

  def input_to_index(user_input)
   user_input.to_i - 1
  end

  def move(position, char)
    @board[position] = char
  end

  # Determines what positions on the board are taken.
  # If a position contains a "X" or "O" value, then we get a "true" value
  # If a position does not contain a "X" or "O" value, then we get a "false" value

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end
  end

  # Determines whether a move is valid or not
  # Passes in an index value between 0 and 8

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # Asks the user for a number
  # Sets the index value to the entered number
  # If the move is valid, then call the move method and display the board
  # Else, call the turn method

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else
      WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
    end
  end

  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else
            nil
          end
    end
  end

  def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end






end
