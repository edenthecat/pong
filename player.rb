class Player
  attr_reader :x, :y, :image

  def initialize(window, side)
    @image = Gosu::Image.new("media/paddle.png")
    @side = side
    if (side == "left")
      @x = 50
    elsif (side == "right")
      @x = window.width - @image.width - 50
    end
    @y = window.height/2 - @image.height/2
    @window = window
    @score = 0
  end

  def wins
    @score += 1
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def update
    if Gosu::button_down?(up_button)
      @y -= 5 unless @y == 0
    elsif Gosu::button_down?(down_button)
      @y += 5 unless @y == (@window.height-@image.height)
    end
  end

  private

  def up_button
    if(@side == 'right')
      return Gosu::KbUp
    elsif(@side == 'left')
      return Gosu::KbW
    end
  end

  def down_button
    if(@side == 'right')
      return Gosu::KbDown
    elsif(@side == 'left')
      return Gosu::KbS
    end
  end

end
