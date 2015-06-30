class Chess
  class CLI
    def initialize(stdin, stdout)
      @stdin, @stdout = stdin, stdout
    end

    def call
      while game.playing?
        print_board game.board
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

    # game.moves_for(from_location)

    def print_turn(player_colour)
      @stdout.puts "#{player_colour}'s turn"
    end

  end
end
