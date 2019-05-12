module Escape
  # Public: Support class providing some useful methods.
  class Support
    # Public: Return x coordinates of the supplied coordinates arrays.
    class << self
      # Examples:
      # Support.get_x([10, 24])
      # # => 10
      #Returns Integer.
      def get_x coords
        coords.first
      end

      # Public: Return y coordinates of the supplied coordinates arrays.
      #
      # Examples:
      # Support.get_x([10, 24])
      # # => 24
      #Returns Integer.
      def get_y coords
        coords.last
      end

      # Public: Creates a number of players.
      #
      # Returns: Arrays of Player objects.
      def create_players
        players = []
        players << create_player('player_1')
        players << create_player('player_2')
        players
      end

      # Public: Place all the maze players on the start cell
      #
      # players - array of Player objects
      # start_coordinates - start cell coordinates array
      def set_on_start(players, start_coordinates)
        players.each do |player|
          player.x = get_x(start_coordinates)
          player.y = get_y(start_coordinates)
        end
      end

      private

      def create_player name
         Escape::HumanPlayer.new(name)
      end
    end
  end
end
