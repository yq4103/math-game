class Question
  def initialize
    @numOne = (rand*20 + 1).to_i
    @numTwo = (rand*20 + 1).to_i
    @answer = @numOne + @numTwo
  end

  def print_question(name)
    puts "#{name}: what does #{@numOne} plus #{@numTwo} equal?"
  end

  def check_answer(input)
  input == @answer
  end

end