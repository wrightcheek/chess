require 'chess/board'

class Chess
  class Piece
    attr_reader :type, :colour
    def initialize(type, colour)
      @type, @colour = type, colour
    end
  end

  attr_reader :status

  def initialize(board: Board.default)
    @status  = :in_progress
    @board   = board
    @players = [:white, :black]
  end

  def playing?
    @playings ||= [true, true, true, true, false]
    @playings.shift
  end

  # x, y means x and y index as integers
  # if only a x, then we have a location like 'f2'
  def [](x, y=nil)
    @board[x, y]
  end

  def current_player
    @players.first
  end

  def possible_moves_from(location)
    ['f2', 'f3']
  end

  def move(from, to)
    @players.rotate!
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
