require './game'

class Player

  attr_reader :name #getter
  attr_accessor :lives, :num, :answer #getter + setter
  # attr_writer => setter only

  # constructor
  def initialize(name)
    @name = name
    @lives = 3
  end


  def is_dead?
    @lives == 0
  end


end