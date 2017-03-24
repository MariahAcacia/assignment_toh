#Tower of Hanoi assignment
#user specifies hieght of tower
#goal is to move the entire tower from one rod to another rod with the following restrictions:
#you can  move only one disk at a time
#you can move only the top disk of any given stack
#you can stack only smaller disks on larger disks. a larger disk cannot be stacked on a smaller disk
class TowerOfHanoi

  def initialize(number_of_disks)
    @size_of_disks = number_of_disks
    @game_board = [[],[],[]] #3 rods
    @rods = [1,2,3]
    @moves = 0
  end

  #game board depends on number of disks specified by user, number of disks is the number of rows

  def game_board
    spaces = (@size_of_disks - 1)
    iterator = 1

    while iterator <= @size_of_disks do
      @game_board[0] << ("o" * iterator) + (" " * (@size_of_disks - iterator))
      iterator += 1
    end
    puts "Current board: "
    puts @game_board
    print @rods.join("      ")
  end


  #check if user input is valid before moving disks
  def is_move_valid?(from,to, disk_to_move)
    if (@game_board[from-1] != nil) && ((@game_board[to - 1][0] == nil) || (@game_board[from - 1][0] < @game_board[to - 1][0]))
      return true
    else
      return false
    end
  end


  #how to move disks based on user input
  def move_disk(from, to, disk_to_move)
  #  disk_to_move = @game_board[from - 1][0]
    @game_board[to - 1].unshift(disk_to_move)
    @game_board[from - 1].shift
    print @game_board
    print @rods.join("    ")
  end

  #check to see when the game has been won
  def win?
    if (@game_board[1].length == @size_of_disks) || (@game_board[2].length == @size_of_disks)
      puts "You win!! You won in #{@moves} moves"
      return true
    else
      return false
    end
  end


  def play
    #instructions for user
    puts "Welcome to the Tower of Hanoi"
    puts "Instructions:"
    puts "Enter where you would like to move a disk from (either rod number 1, 2 or 3)"
    puts "Then enter where you would like to move that disk to (either rod number 1, 2, or 3)"
    puts "You can only move one disc at a time and you cannot place a larger disc on top of a smaller one"
    puts "You have won the game once the entire tower is moved to a different rod or type q to quit"

    #display starting game board
    puts game_board

    #get user moves from and to location, move disks
    until win? == true do #eventually will be until win? or user enters q, < 7 is for testing purposes
      puts "From which rod would you like to move a disk from?"
      from = gets.chomp.to_i

      puts "And where would you like to move it to?"
      to = gets.chomp.to_i

      disk_to_move = @game_board[from - 1][0]
      #as long as user inputs are valid move disks from and to
      if is_move_valid?(from,to,disk_to_move) == true
        move_disk(from,to,disk_to_move)
      else
        puts "That is not a valid move, please re-enter"
        next
      end
      @moves += 1
    end



  end



end

n = TowerOfHanoi.new(4)
n.play
