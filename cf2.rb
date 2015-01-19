=begin
THINGS I WANT TO ADD - 
  check diagnol
  after game is done, ask the player if they want to play again.
  if they decide to quit, ask them to verify if they really want to quite...
  have the players roll for random start. DONE


# OMG THIS WORKS......HOWEVER IT RETURNS NIL, NOT SURE IF THIS WILL FUCK THINGS UP.!
# def place_game_piece
#   num = toy.length - 1
#   while num >= 0
#     if toy[1][num] == '-'
#       toy[1][num] = 'X'
#       break
#     end
#     num -= 1
#   end
# end
# (x|o){4}
I do not understand why this doesn't work
  I keep getting

  @test = "1--xxxx2------3------4----x-5----x-6----x-7o-----"
def find_a_match(array)
  array.include?(/x../)
end
p find_a_match(@test)
no implicit conversion of Regexp into String (TypeError)

going to need something similar to the game over in this snippet
players = []
players[0] = User.new
players[1] = User.new # or AI.new

current_player = 0
game_over = false

while !game_over do
  # the User#make_move and AI#make_move method are where you
  # differentiate between the two - checking for game rules
  # etc. should be the same for either.
  players[current_player].make_move

  if check_for_game_over
    game_over = true
  else
    # general method to cycle the current turn among
    # n players, and wrap around to 0 when the round 
    # ends (here n=2, of course)
    current_player = (current_player + 1) % 2
  end
end
http://stackoverflow.com/questions/7329097/setting-up-two-players-in-a-game
http://stackoverflow.com/questions/7033165/algorithm-to-check-a-connect-four-field

=end
require_relative 'player'


@board        = Array.new(6, Array.new(7, "-"))
header        = Array("1".."7")
@board.unshift(header)
@flipped      = @board.transpose

wait
reset_screen!
center_it
puts "Your starting board".center(center_it)
@boards = @flipped.transpose
  @board.each do |column|
    puts column.map { |row| row }.join(" ")
  end
puts

def place_game_piece(player)
  puts "#{player.name} your turn"
  
  while true
    print "Enter a column number or type 'q': "
    input = gets.chomp.downcase
    if input == "1" || input == "2" || input == "3" || input == "4" || input == "5" || input == "6" || input == "7"

      if input == "1"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[0][num] == '-'
             @flipped[0][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it) 
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end 
        break
      end

      if input == "2"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[1][num] == '-'
             @flipped[1][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it)
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end
        break
      end

      if input == "3"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[2][num] == '-'
            @flipped[2][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it)
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end
        break
      end

      if input == "4"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[3][num] == '-'
             @flipped[3][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it)
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end
        break
      end

      if input == "5"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[4][num] == '-'
             @flipped[4][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it)
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end
        break
      end

      if input == "6"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[5][num] == '-'
             @flipped[5][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it)
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end
        break
      end

      if input == "7"
        num = @flipped.length - 1
        while num >= 0
          if @flipped[6][num] == '-'
             @flipped[6][num] = player.piece
            break
          end
          num -= 1
        end
        reset_screen!
        @boards = @flipped.transpose
        puts "Your game board".center(center_it)
        @boards.each do |column|
          puts column.map { |row| row }.join(" ")
        end
        break
      end

    elsif input == 'q'
      reset_screen!
      puts "I'm so sorry you decided to go, 'GOOD-BYE!"
      puts
      exit
    else
      puts "\nI don't understand that request!"
    end #ends the first if statement
  end #this ends the until loop
end #this ends the method



#- - - - - - - - - - - - - - - - - - - - - -
#  CHECKING FOR WINNER
#- - - - - - - - - - - - - - - - - - - - - -
def check_for_game_over(boards)
  #CHECKING FOR A TIE
  temp_array = []
  if boards.flatten.select { |cell| temp_array << cell  if cell == "-" }
    if temp_array.length == 0
      puts "This game is a tie"
      puts "You both suck at this game!!!"
      puts "GOOD-BYE!"
      exit
    end
  end
    # CHECKING COLUMNS FOR WINNER
    if boards.transpose.map do |col|
        return true if col.join().match(/X{4}|O{4}/)
       end
    end
  # CHECKING ROWS FOR WINNER
    if boards.map do |row|
        return true if row.join().match(/X{4}|O{4}/)
      end 
    end
    # CHECKING DIAGONAL UPPER LEFT TO BOTTOM RIGHT - - - - - - - - - - - -
    if temp_array = (3..6).collect { |i| boards[i][-3+i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (2..6).collect { |i| boards[i][-2+i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    #return true if (1..6).collect { |i| boards[i][i-1] }.join().match(/X{4}|O{4}/) => refactor to this (first go around)
    if temp_array = (1..6).collect { |i| boards[i][i-1] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (1..6).collect { |i| boards[i][0+i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (1..5).collect { |i| boards[i][1+i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (1..4).collect { |i| boards[i][2+i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # CHECKING DIAGONAL UPPER RIGHT TO BOTTOM LEFT
    if temp_array = (1..6).collect { |i| boards[i][0-i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (2..6).collect { |i| boards[i][1-i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    #return true if (3..6).collect { |i| boards[i][2-i] }.join().match(/X{4}|O{4}/)
    if temp_array = (3..6).collect { |i| boards[i][2-i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (1..6).collect { |i| boards[i][-1-i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (1..5).collect { |i| boards[i][-2-i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end

    if temp_array = (1..4).collect { |i| boards[i][3-i] }
      return true if temp_array.join().match(/X{4}|O{4}/)
    end


end
#- - - - - - - - - - - - - - - - - - - - - -

begin
  #print "hit return to continue or 'q' to quit: "
  #quit = gets.chomp.downcase
  #if quit == 'q'
  #  reset_screen!
  #  puts "Oh no, you don't want to play Connect Four? GOOD BYE!"
  #  break
  #end
 
  @players.cycle do |player|
    place_game_piece(player)
    #check_for_game_over(@boards)
    if check_for_game_over(@boards) == true
      puts
      puts "WINNER WINNER CHICKEN DINNER"
      sleep(0.9)
      puts
      puts "Nice job #{player.name}, YOU ARE THE WINNER!!!!"
      break
    end
  end
end while check_for_game_over(@boards) == nil





puts




#-------BONE YEARD-------------
=begin

if boards.transpose.map do |col|
  return true if col.join().match(/X{4}|O{4}/)
  end
end

def winner?
  if check_for_game_over(@boards) == nil
    exit #this exits me from the program all together
  elsif check_for_game_over(@boards) == "tie"
    puts "This game ends in a tie.. you both suck!"
  else
    puts "WINNER"
  end
end

board = [
 ["1",  "2",   "3",   "4",   "5",   "6",   "7"],
 ["X",  "B",   "C",   "D",   "E",   "F",   "G"],
 ["H",  "X",   "J",   "K",   "L",   "M",   "N"],
 ["O",  "P",   "X",   "R",   "S",   "T",   "U"],
 ["V",  "W",   "X",   "X",   "Z",   "AA",  "BB"],
 ["CC", "DD",  "EE",  "FF",  "GG",  "HH",  "II"],
 ["JJ", "KK",  "LL",  "MM",  "NN",  "OO",  "PP"]]

- - - - - - up to the right - - - - - - - - -
pry(main)> (1..6).collect { |i| board[-i][i] }
=> ["KK", "EE", "Y", "S", "M", "G"]

 pry(main)> (2..6).collect { |i| board[1-i][i] }
=> ["LL", "FF", "Z", "T", "N"]

[23] pry(main)> (3..6).collect { |i| board[2-i][i] }
=> ["MM", "GG", "AA", "U"]

- - - - - - down to the right - - - - - - - - -
pry(main)> 
=> ["B", "J", "R", "Z", "HH", "PP"]

pry(main)> (1..5).collect { |i| board[i][1+i] }
=> ["C", "K", "S", "AA", "II"]

- - - - - - down to the left - - - - - - - - -DONE
pry(main)> pry(main)> (1..6).collect { |i| board[i][0-i] }
=> ["G", "M", "S", "Y", "EE", "KK"]

pry(main)> (2..6).collect { |i| board[i][1-i] }
=> ["N", "T", "Z", "FF", "LL"]

pry(main)> (3..6).collect { |i| board[i][2-i] }
=> ["U", "AA", "GG", "MM"]

BELOW ALSO TOOK CARE OF LEFT UP TO THE RIGHT
(1..6).collect { |i| board[i][-1-i] }
=> ["F", "L", "R", "X", "DD", "JJ"]

pry(main)> (1..5).collect { |i| board[i][-2-i] }
=> ["E", "K", "Q", "W", "CC"]

(1..4).collect { |i| board[i][-3-i] }
=> ["D", "J", "P", "V"]






(1..6).collect{|i|board[i][i]}
=> ["1A", "2B", "3C", "4D", "5E", "6F"]
http://stackoverflow.com/questions/2506621/ruby-getting-the-diagonal-elements-in-a-2d-array
lol... or this 
Matrix.rows(array).each(:diagonal).to_a

=end