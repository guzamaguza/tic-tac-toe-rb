WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
   index = input.to_i - 1
   return index
end


def move(board, index, current_player)
  board[index] = current_player
end


def position_taken?(board, index)
  #position_taken = boolean

  if board[index] == " " || board[index] == "" || board[index] == nil
      return position_taken = false
  elsif board[index] == "X" || board[index] == "O"
    return position_taken = true
  else
    return position_taken = true
  end
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  #get the user input
  puts "Please enter 1-9:"
  user_input = gets.strip;
    index = input_to_index(user_input);
    token = current_player(board)

    if valid_move?(board, index)
        puts 'Valid Move!'
        move(board, index, token)
        display_board(board)
    else
        puts 'Try Again!'
        turn(board)
    end
    #display_board(board)
end


def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
    end
  end
  return counter
end


def current_player(board)
  if turn_count(board)%2 == 0
    token = 'X'
  else
    token = 'O'
  end
end


def won?(board)
    WIN_COMBINATIONS.detect do |position|
      if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
        position
      elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
        position
      else
        nil
      end
    end
end


def full?(board)
  board.all? do |cell|
  cell == "X" || cell == "O"
  end
end


def draw?(board)
    if !won?(board) && full?(board)
      true
    #elsif !won?(board) && !full?(board)
    #  false
    #else won?(board)
    #  false
    end
end


def over?(board)
      if won?(board) || full?(board) || draw?(board)
        true
      else
        false
      end
end


def winner(board)
     if solution = won?(board)
       board[solution.first]
     else
       nil
     end
end


def play(board)
  until over?(board)==true
    turn(board)
  end

  if won?(board) != nil
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end

