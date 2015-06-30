require 'chess/board'

class Chess
  attr_reader :status, :winning_player

  def initialize(board: Board.default)
    @status  = :in_progress
    @board   = board
    @players = [:white, :black]
  end

  # FIXME!!
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

  # FIXME!!
  def possible_moves_from(location)
    @fake_moves ||= [
      ['f3', 'f4'],
      ['e5', 'e6'],
      ['g3', 'g4'],
      ['h4', 'g5', 'f6', 'e7']
    ]
    @fake_moves.shift
  ensure
    if @fake_moves.empty?
      @status = :checkmate
      @winning_player = current_player
    end
  end

  def move(from, to)
    @players.rotate!
    @board.move from, to
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
