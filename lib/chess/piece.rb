class Chess
  class Piece
    attr_reader :type, :colour
    def initialize(type, colour)
      @type, @colour = type, colour
    end
  end
end
