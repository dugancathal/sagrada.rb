class InMemoryGameRepo
  def initialize
    @games = []
    @current_id = 1
  end

  def all
    games
  end

  def next_id
    current = current_id
    self.current_id += 1
    current
  end

  def save(game)
    games << game
  end

  protected
  attr_accessor :current_id, :games
end