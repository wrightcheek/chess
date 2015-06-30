class Chess
  class Piece
    attr_reader :type, :colour
    def initialize(type, colour)
      @type, @colour = type, colour
    end
  end

  def initialize
    @board = Array.new 8 do
      Array.new(8) { Piece.new :empty_square, :none }
    end
    @board[0] = [
      Piece.new(:rook,   :black),
      Piece.new(:knight, :black),
      Piece.new(:bishop, :black),
      Piece.new(:queen,  :black),
      Piece.new(:king,   :black),
      Piece.new(:bishop, :black),
      Piece.new(:knight, :black),
      Piece.new(:rook,   :black),
    ]

    @board[1]  = Array.new(8) { Piece.new :pawn, :black }
    @board[-2] = Array.new(8) { Piece.new :pawn, :white }

    @board[-1] = [
      Piece.new(:rook,   :white),
      Piece.new(:knight, :white),
      Piece.new(:bishop, :white),
      Piece.new(:queen,  :white),
      Piece.new(:king,   :white),
      Piece.new(:bishop, :white),
      Piece.new(:knight, :white),
      Piece.new(:rook,   :white),
    ]
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
    @board[y][x]
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

  def to_s
    lines = 8.times.map do |y|
      pieces = 8.times.map { |x| avatar_for self[x, y] }.join('  ')
      "#{8-y}  #{pieces}\n"
    end
    lines.join + "   a  b  c  d  e  f  g  h\n"
  end

  def avatar_for(piece)
    avatars = {
      black: {
        rook:   '♜',
        knight: '♞',
        bishop: '♝',
        queen:  '♛',
        king:   '♚',
        pawn:   '♟',
      },
      white: {
        rook:   '♖',
        knight: '♘',
        bishop: '♗',
        queen:  '♕',
        king:   '♔',
        pawn:   '♙',
      },
      none: {
        empty_square: ' ',
      }
    }
    avatars[piece.colour][piece.type]
  end
end
