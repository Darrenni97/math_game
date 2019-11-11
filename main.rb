require "./players"
require "./question"

class Game

  def initialize
    @player_one = Players.new
    @player_two = Players.new
    @active_player = 1
  end

  def check
    while @player_one.lives > 0 && @player_two.lives > 0
      question = Question.new
      puts "Player #{@active_player}: What does #{question.first_num} plus #{question.second_num} equal?"
      print ">"
      input = gets.chomp.to_i
      if input == question.answer
        puts "Player #{@active_player}: Yes! That is correct!"
        @active_player == 1 ? @active_player = 2 : @active_player = 1
      else 
        puts "Player #{@active_player}: Seriously? No!"
        if @active_player == 1
          @player_one.lives -= 1
          @active_player = 2
        else
          @player_two.lives -= 1
          @active_player = 1
        end
      end
      puts "P1: #{@player_one.lives}/3 VS P2: #{@player_two.lives}/3"
      puts "----NEW TURN----"
    end
  end
end

new_game = Game.new
new_game.check

