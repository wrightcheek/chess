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
        @stdout.puts  game
        @stdout.puts  show_turn
        @stdout.print prompt_from_location
        from = @stdin.gets.chomp

        @stdout.puts  show_available_moves(from)
        @stdout.print prompt_to_location(from)
        to = @stdin.gets.chomp

        game.move from, to

        @stdout.puts
        @stdout.puts show_move_summary(from, to)
        @stdout.puts
      end

      @stdout.puts game
      @stdout.puts
      @stdout.puts show_game_summary
      0
    end

    private

    attr_reader :game

    def show_game_summary
      "#{game.status.to_s.capitalize}, #{game.current_player} wins.\n"
    end

    def show_move_summary(from, to)
      "Ok, #{game.current_player}'s #{game[to].type} #{from} to #{to}."
    end

    def show_available_moves(from_location)
      piece          = game[from_location]
      possible_moves = game.possible_moves_from(from_location).join(', ')

      "moves for #{game.current_player} #{piece.type} #{from_location}: #{possible_moves}\n"
    end

    def prompt_from_location
      "#{game.current_player}, your move? "
    end

    def prompt_to_location(from_location)
      "#{game.current_player}, move #{from_location} where? "
    end

    def show_turn
      "#{game.current_player}'s turn"
    end
  end
end
