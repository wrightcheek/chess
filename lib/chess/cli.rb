require 'chess'

class Chess
  class CLI
    def initialize(stdin, stdout)
      @stdin  = stdin
      @stdout = stdout
      @game   = Chess.new
    end

    def call
      while game.playing?
        @stdout.puts show_board(game.board)
        print_turn

        from = prompt_from_location
        print_available_moves(from)
        to = prompt_to_location
        game.move from, to

        empty_line
        print_move_summary from, to
        empty line
      end

      print_board game.board
      empty_line
      print_game_summary
      0
    end

    private

    attr_reader :game

    # game.moves_for(from_location)

    def print_turn(player_colour)
      @stdout.puts "#{player_colour}'s turn"
    end

    def show_board(board)
      lines = 8.times.map do |x|
        pieces = 8.times.map { |y| avatar_for board[x, y] }.join('  ')
        "#{8-x}  #{pieces}\n"
      end
      lines.join + "   a  b  c  d  e  f  g  h\n"
    end

    def avatar_for(piece)
      return '♜'
      avatars = {
        black: {
          rook:   ♜,
          knight: ♞,
          bishop: ♝,
          queen:  ♛,
          king:   ♚,
          pawn:   ♟,
        },
        white: {
          rook:   ♖,
          knight: ♘,
          bishop: ♗,
          queen:  ♕,
          king:   ♔,
          pawn:   ♙,
        }
      }
      avatars[piece.colour][piece.type]
    end
  end
end
