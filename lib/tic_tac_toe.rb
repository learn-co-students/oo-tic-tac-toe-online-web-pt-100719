class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  # Declare our initialize method
  # Sets the value of our board to nil when a new instance
    # is created.
  # Instance variable @board = value for 'board' or
    # an array of nine items with blank elements.
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # The method which displays the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " # Top row
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " # Middle row
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " # Bottom row
  end

  # Input index
  # Passes argument of number and subtracts one from
    # the passed integer => 1 - 1 = 0
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, char)
    @board[position] = char
  end

  # This method passes in an argument of an index integer
  # Depending on the passed integer, either a "X" or "O"
    # will be placed

  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # Determines the number of turns by setting the initial count to "0"
  # Then calls our board array and iterates each space within the array
  # If space is equal to "X" or space is equal to "O"
    # add one to our number of turns counter
  # Display the number of turns

  def turn_count
    number_of_turns = 0 # Set local variable
    @board.each do |space|
      if space == "X" || space == "O"
        number_of_turns += 1
      end
  end
  return number_of_turns

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  # Player is prompted to enter a value: 1-9
  # Input is collected from player and the value is passed
    # to the input_to_index method. This value is set to a local variable
    # called 'index'
  # Set a local variable 'char' to equal the current_player method
  # Create if/else statment which calls on the valid_move method
    # We pass the value for index into the method
    # If the move is valid, it places "X" or "O" into the Given
    # index number. The new value of the board is displayed.
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

  # Method which determines the winner
  # Calls upon the WIN_COMBINATIONS class constant
  # Checks the board and determines which char is in what
    # position
  # If the defined positions contain "X", display win_combo
  # If the defined positions contain "O", display win_combo
  # If neither conditions are met, the method returns a false values

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end

  # Checks to see if all the spots on the board are full

  def full?
    @board.all? do |occupied|
      occupied != " "
    end
  end

  # This method checks if the conditions in the
    # 'won?', 'full?', or 'draw?' methods have been met

  def over?
    won? || full? || draw?
  end

  # Similar to the 'won?' method, this method determines
    # the game's winner

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

  # Our play method determines if a game is over or still going
  # If the game is not over, then call upon the turn method.
  # If the game is over, a message is put out declaring the winner
  # If the game results in a draw, put another message

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

end
