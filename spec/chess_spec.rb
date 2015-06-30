require 'chess'

RSpec.describe Chess do
  def expect_piece(piece, type, colour)
    expect(piece.type).to eq type
    expect(piece.colour).to eq colour
  end

  let(:game_white_wins) do
    Chess.new board: Chess::Board.new(
      [0, 0] => Chess::Piece.new(:rook, :white),
      [0, 1] => Chess::Piece.new(:rook, :white),
      [0, 2] => Chess::Piece.new(:king, :white),
      [1, 0] => Chess::Piece.new(:king, :black),
    )
  end

  let(:game_black_wins) do
    Chess.new board: Chess::Board.new(
      [0, 0] => Chess::Piece.new(:rook, :black),
      [0, 1] => Chess::Piece.new(:rook, :black),
      [0, 2] => Chess::Piece.new(:king, :black),
      [1, 0] => Chess::Piece.new(:king, :white),
    )
  end

  let(:in_progress_game) { Chess.new }
  let(:checkmated_game)  { game_white_wins }
  let(:stalemated_game)  { raise 'figure out what I am!' }


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
      pending 'Chess needs to work first :P'
      expect(game_white_wins.status).to eq :checkmate
      expect(game_black_wins.status).to eq :checkmate
    end

    specify ':stalemate    when.... go read the rules :P'
  end


  specify 'playing? is true, when the status is in_progress' do
    expect(in_progress_game).to be_playing
    pending 'need statuses to be correct'
    expect(checkmated_game).to_not be_playing
    expect(stalemated_game).to_not be_playing
  end

  describe '#[]' do
    example 'game[3, 0] at the location of x and y, as integer indexes' do
      expect_piece Chess.new[3, 0], :queen, :black
    end

    example "game['d8'] is the same as game[3, 0]" do
      expect_piece Chess.new['d8'], :queen, :black
    end
  end

  describe '#current_player' do
    it 'starts at :white' do
      expect(Chess.new.current_player).to eq :white
    end

    it 'switches between :white, and :black after each move' do
      game = Chess.new
      expect(game.current_player).to eq :white
      game.move('a2', 'a3')
      expect(game.current_player).to eq :black
      game.move('a7', 'a6')
      expect(game.current_player).to eq :white
    end
  end

  # possible_moves_from
  #   an array of.... uhm....
  #   (when joined, gives like: ['f2', 'f3'])

  describe 'move' do
    it 'moves the piece from the first location to the second location' do
      game = Chess.new
      game.move 'f2', 'f3'
      expect_piece game['f2'], :empty_square, :none
      expect_piece game['f3'], :pawn, :white
    end
  end

  # -------------------------------
  # some future point:
  #   what happens when you can't move here?
  #   how does a piece determine where it can move to?
  #     based on how it moves
  #     based on what the board looks like right now
end
