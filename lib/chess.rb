class Chess
  class Piece
    attr_reader :type, :colour
    def initialize(type, colour)
      @type, @colour = type, colour
    end
  end

  def status
    :checkmate
  end

  def playing?
    @playings ||= [true, true, true, true, false]
    @playings.shift
  end

  # x, y means x and y index as integers
  # if only a x, then we have a location like 'f2'
  def [](x, y=nil)
    Piece.new(:pawn, :white)
  end

  def current_player
    :white
  end

  def possible_moves_from(location)
    ['f2', 'f3']
  end

  def move(from, to)
    ??
  end
end
