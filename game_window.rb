require 'gosu'
require_relative 'player'
require_relative 'ball'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Pong Game"

    @player_1 = Player.new(self, "left")
    @player_2 = Player.new(self, "right")
    @ball = Ball.new(self, @player_1, @player_2)
  end

  def update
    # ...
    @player_1.update
    @player_2.update
    @ball.update
  end

  def draw
    # ...
    @player_1.draw
    @player_2.draw
    @ball.draw
  end
end

Tutorial.new.show
