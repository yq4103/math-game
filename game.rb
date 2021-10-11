require './player'
require './question'

class Game 
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2]
    @round = 1
  end

  def next_round
    @round += 1
  end

  def turns(player)
    question = Question.new
    question.print_question(player.name)
    answer = gets.chomp.to_i
    if (question.check_answer(answer))
    puts "#{player.name}: Yes! You are correct."
    player.lives
    end
    if (!question.check_answer(answer))
    puts "#{player.name}: Seriously? No!"
    player.lives -= 1
    end
    check_score
  end

  def display_game_status
    # display status of the game
    # @players.each{|player|  puts "#{player.name}: #{player.lives}/3"}
    puts "#{@players.first.name}: #{@players.first.lives}/3 vs #{@players.last.name}: #{@players.last.lives}/3"
  end

  def check_score
    if (@players.first.is_dead?)
    winner(@players.last)
    elsif (@players.last.is_dead?)
      winner(@players.first)
    end
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
    puts "-------Game Over-------"
    puts "Good bye!"
    exit(true)
  end


  def play
    while (@players.first.lives > 0 || @players.last.lives > 0) do

      # Round

      puts
      turns(@players.first)
      display_game_status

      puts "----------New Turn-----------"

      puts
      turns(@players.last)
      display_game_status

      puts "----------New Turn-----------"

      next_round
      sleep 0.5
    end
  end
end

