class Chess
  class CLI
    def initialize(stdin, stdout)
      @stdin, @stdout = stdin, stdout
    end

    def call
      while game.playing?
        print the board
        print whose turn it is
        prompt for which piece to move
        list possible moves
        prompt for location to move to
        empty line
        print move summary
        empty line

      print the board
      empty line
      game summary (winner)
      0
    end
  end
end
