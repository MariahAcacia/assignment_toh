#Tower of Hanoi assignment
#user specifies hieght of tower
#goal is to move the entire tower from one rod to another rod with the following restrictions:
#you can  move only one disk at a time
#you can move only the top disk of any given stack
#you can stack only smaller disks on larger disks. a larger disk cannot be stacked on a smaller disk
class TowerOfHanoi
  #instructions for user
  puts "Welcome to the Tower of Hanoi"
  puts "Instructions:"
  puts "Enter where you would like to move from and to in the format '1,3'"
  puts "Enter q to quit."
  #prompt user to enter how many disks they would like to play with
  print "To start, please enter how many disks would you like to play with: "
  number_of_disks = gets.chomp.to_i

  def initialize(number_of_disks)
    @number_of_disks = number_of_disks
    @number_of_rods = [1,2,3]
  end

  #game board depends on number of disks specified by user, number of disks is the number of rows

  def game_board
    game_board = Array.new(@number_of_disks) { Array.new(3) }
    #need a loop to populate the board with disks based on how many disks the user specified, base disk number of o's = number_of_disks specied by user, then one less for each higher row until top row has only one "o"
    game_board.map { |row| row = "o" * @number_of_disks }
  end

  #prints game board, and spaces rods with enough room for how big largest disk is
  def print_game_board
    puts game_board
    if @number_of_disks <= 4
      print @number_of_rods.join("    ")
    elsif @number_of_disks > 4 && @number_of_disks < 10
      print @number_of_rods.join("                ")
    else
      print @number_of_rods.join("                            ")
    end
  end

  n = TowerOfHanoi.new(number_of_disks)
  n.print_game_board

  def user_moves
  end

end
