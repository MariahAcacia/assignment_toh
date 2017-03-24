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


  #get user moves
  def get_user_moves
    puts "Please enter move: "
    @moves= gets.chomp.split(",").map(&:to_i)
  end


  #check if user input is valid before moving disks
  def is_move_valid

  end


  #how to move disks based on user input
  def move_disks
    starting_index = @moves[0] - 1
    move_to_index = @moves[1] - 1
    disk_to_move = @game_board[starting_index][0]
    @game_board[move_to_index].unshift(disk_to_move)
    @game_board[starting_index].shift
    print @game_board
    print @rods.join("    ")
  end


  def play
    #instructions for user
    puts "Welcome to the Tower of Hanoi"
    puts "Instructions:"
    puts "Enter where you would like to move from and to in the format '1,3'"
    puts "Enter q to quit."
    #display starting game board
    puts game_board
    #get user moves
    get_user_moves
    #as long as user inputs are valid move disks from and to
    move_disks
    #reprint game board
    get_user_moves
    move_disks
    get_user_moves
    move_disks
  end

end

n = TowerOfHanoi.new(6)
n.play
