module Escape
  # Public: Random player.
  class RandPlayer < Player

    # Public: Moves the player in one of the directions.
    #
    # Updates a player's coordinates randomly.
    def query_next_direction
      # Commented as the below version using 'rand' is desireed by client
      #[:left, :up, :right, :down].sample
      directions = DIRECTIONS.keys
      directions[rand(directions.length)]
    end
  end
end
