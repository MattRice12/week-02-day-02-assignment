# Program: pick a random number between 1 and 100 and ask you for a guess.
# If guess < program's number --> puts "you were low; guess again."
# If guess > program's number --> puts "you were high; guess again."
# If guess == program's number --> puts "you are correct; you win!" & quit program.

# After 5 incorrect guesses, program says you lose.
# If you guess the same number twice, program asks if you're feeling all right (or something similarly sarcastic).
# All of your code should be inside of classes.
# This game should be run from the command line by typing ruby bin/guessing_game.rb.

# ___________
# UML:
  # Greet player
  # Generate random number
  # loop do
    # Prompt player to pick
    # Player picks number
    # If player_num > random_num --> puts "Wrong! Too high!"
    # If player_num < random_num --> puts "Wrong! Too low!"
    # If player num == random_num --> puts "You got it!"
  #end

# Classes = Number_set, Number_generator, Player, Game

#Data: Numbers 1-100
#Behavior: Holds set
class Number_gen
  attr_reader :num_set
  def initialize
    @num_gen = num_gen
  end

  def num_gen
    @num_gen = *(1..100)
    @num_gen.sample
  end
end

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Game
  attr_reader :name, :game_number
  def initialize
    @name = welcome
    @player   = Player.new(@name)
    @computer = Player.new("Skynet")
    @game_number = Number_gen.new
  end

  def welcome
    system("clear")
    puts "Welcome to the Guessing Game!"
    puts
    print "Please input your name. > "
    gets.chomp
  end

  def greeting
    system("clear")
    puts "Welcome to the Guessing Game!"
    puts
    puts "Hello, #{@player.name}! Today you will be playing #{@computer.name}!"
    puts
  end

  def explain_rules
    puts "The rules of the game are simple! Guess a number between 1 and 100, and I will tell you if you are too high or too low. 5 wrong guesses, and you lose!"
    puts
  end

  def guess_number
    loop do
      puts "Please guess a number from 1 to 100. > "
      response = gets.chomp.to_i
      if response != 0 && response <= 100
        return response
      else
        puts "___________________________________"
        puts "Sorry, that is an incorrect input."
        puts
      end
    end
  end

  def start
    greeting
    explain_rules
    ran_number = @game_number.num_gen
    count = 0
    loop do
      response = guess_number
      if response == ran_number
        puts "You got the number! You win!"
        break
      elsif response > ran_number
        puts
        puts "Too high!"
        count += 1
      elsif response < ran_number
        puts
        puts "Too low!"
        count += 1
      else
        puts
        puts "Incorrect input, please guess again!"
      end
      if count >= 5
        puts
        puts "I've given you 5 chances to guess the number #{ran_number}, but you couldn't guess it. ROBOTS TAKE OVER THE WORLD BEEP BOOP!"
        break
      end
    end
  end
end

Game.new.start
