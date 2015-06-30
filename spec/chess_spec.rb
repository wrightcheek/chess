require 'chess'

RSpec.describe Chess do
  it 'starts like a traditional chess board' do
    expect(Chess.new.to_s).to eq \
      "8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜\n"+
      "7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟\n"+
      "6                        \n"+
      "5                        \n"+
      "4                        \n"+
      "3                        \n"+
      "2  ♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙\n"+
      "1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖\n"+
      "   a  b  c  d  e  f  g  h\n"
  end

  describe 'status' do
    specify ':in_progress, at game start' do
      expect(Chess.new.status).to eq :in_progress
    end

    specify ':checkmate    after a player wins' do
      pending 'need more abstractions :)'
      board_white_wins = ??
      game_white_wins  = Chess.new(board: board_white_wins)
      expect(game_white_wins.status).to eq :checkmate

      board_black_wins = ??
      game_black_wins  = Chess.new(board: board_black_wins)
      expect(game_black_wins.status).to eq :checkmate
      # "8 ♖  ♚ "
      # "7 ♖    "
      # "6 K    "
      # "   a  b "
    end

    specify ':stalemate    when.... go read the rules :P'
  end

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
