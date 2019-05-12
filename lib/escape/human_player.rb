module Escape
  # Public: Human Player
  class HumanPlayer < Player

    # Public: Moves the player in one of the directions.
    #
    # game_set - GameSet object.
    # Updates a player's coordinates depending on the provided direction
    # caught from the user keyboard input.
    def query_next_direction(game_set)
      old_x, old_y = x, y
      STDOUT.flush
      input = gets.chomp
      case input
      when DIRECTIONS[:left]
        self.x -= 1
      when DIRECTIONS[:up]
        self.y -= 1
      when DIRECTIONS[:right]
        self.x += 1
      when DIRECTIONS[:down]
        self.y += 1
      else
        puts "Unknown direction"
      end
      self.x, self.y = old_x, old_y unless accessible?(game_set, x, y)
    end

    private
    def accessible?(game_set, x, y)
      cell = game_set.matrix[[x, y]]
      cell.is_accessible?
    end

  end
end
