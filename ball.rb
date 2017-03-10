class Ball
  def initialize(window, player_1, player_2)
    @window = window
    @image = Gosu::Image.new("media/ball.png")
    @x = (window.width - @image.width/2) / 2
    @y = (window.height - @image.height/2) / 2
    @angle = 70
    @player_1 = player_1
    @player_2 = player_2
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def update
    @x += Gosu::offset_x(@angle, 5)
    @y += Gosu::offset_y(@angle, 5)

    if @y >= (@window.height - @image.height)
      @angle -= 90
    elsif @y <= 0
      @angle += 90
    end

    if @x <= 0
      @player_2.wins
      reset
    elsif (@x - @image.width) >= @window.width
      @player_1.wins
      reset
    end

    if (@player_2.y > (@y + @image.height)) ||
        ((@player_2.y + @player_2.image.height) < @y)
      # Do not touch x
    else
      if (@x + @image.width) >= @player_2.x
        @angle -= 270
      end
    end

    if (@player_1.y > (@y + @image.height)) ||
        ((@player_1.y + @player_1.image.height) < @y)
    else
      if @x <= @player_1.x + @image.width
        @angle += 270
      end
    end
  end

  def reset
    @x = (@window.width - @image.width) / 2
    @y = (@window.height - @image.height) / 2
    @angle = 70
  end
end
