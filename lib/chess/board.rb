require 'chess/piece'

class Chess
  class Board
    def self.default
      overrides = {
        [0, 0] => Piece.new(:rook,   :black),
        [1, 0] => Piece.new(:knight, :black),
        [2, 0] => Piece.new(:bishop, :black),
        [3, 0] => Piece.new(:queen,  :black),
        [4, 0] => Piece.new(:king,   :black),
        [5, 0] => Piece.new(:bishop, :black),
        [6, 0] => Piece.new(:knight, :black),
        [7, 0] => Piece.new(:rook,   :black),

        [0, 7] => Piece.new(:rook,   :white),
        [1, 7] => Piece.new(:knight, :white),
        [2, 7] => Piece.new(:bishop, :white),
        [3, 7] => Piece.new(:queen,  :white),
        [4, 7] => Piece.new(:king,   :white),
        [5, 7] => Piece.new(:bishop, :white),
        [6, 7] => Piece.new(:knight, :white),
        [7, 7] => Piece.new(:rook,   :white),
      }

      8.times { |x| overrides[[x,  1]]  = Piece.new :pawn, :black }
      8.times { |x| overrides[[x, -2]] = Piece.new :pawn, :white }

      new overrides
    end

    def initialize(overrides={})
      @board = Array.new 8 do
        Array.new(8) { Piece.new :empty_square, :none }
      end
      overrides.each { |(x, y), piece| self[x, y] = piece }
    end

    def [](x, y)
      @board[y][x]
    end

    def []=(x, y, piece)
      @board[y][x] = piece
    end
  end
end
