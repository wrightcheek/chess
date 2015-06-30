require 'chess'

RSpec.describe Chess do
  # starting configuration
  #   8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜
  #   7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟
  #   6
  #   5
  #   4
  #   3
  #   2  ♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙
  #   1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖
  #      a  b  c  d  e  f  g  h

  # status
  #   :checkmate
  #   :stalemate
  #   :in_progress <-- starting value

  # playing?
  #   when the status is :in_progress

  # []
  #   return a piece
  #   game[0, 1] means x and y index as integers
  #   game['f2'] is the same as game[5, 7]

  # current_player
  #   starts at :white
  #   switches between :white, and :black
  #   switches after moving

  # possible_moves_from
  #   an array of.... uhm....
  #   (when joined, gives like: ['f2', 'f3'])

  # move(from, to)
  #   moves the piece at `from` to `to`

  # -------------------------------
  # some future point:
  #   what happens when you can't move here?
  #   how does a piece determine where it can move to?
  #     based on how it moves
  #     based on what the board looks like right now
end
