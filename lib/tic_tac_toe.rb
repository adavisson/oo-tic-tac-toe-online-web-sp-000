class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]
  
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
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    cp = current_player                #Double check this line
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    turn = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turn += 1
      end
    end
    turn
  end
  
  def current_player
    turn = turn_count
    if turn % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
    winning_combo = false
    
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
    
      pos_1 = @board[win_index_1]
      pos_2 = @board[win_index_2]
      pos_3 = @board[win_index_3]
    
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        winning_combo = win_combo
      end
    end
    winning_combo
  end
  
  def full?
    index = -1
    @board.all? do |idx|
      index += 1
      position_taken?(index)
    end
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    combo = won?
    if combo
      @board[combo[0]]
    else
      nil
    end
  end
  
  def play
    until over? do
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      puts "uh oh"
    end
  end
  
end