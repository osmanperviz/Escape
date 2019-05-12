module Escape
  # Public: Engine of the application.
  class Engine

    # Public: Initialize the Engine.
    #
    # game_set  - A GameSet object.
    # player    - An array of Player objects.
    def initialize(game_set, players = [])
      @game_set = game_set
      @players = players
    end

    # Public: Runs the maze application.
    #
    # It is looping over all the participating players inviting each of them
    # to move their player.
    def run
      loop do
        @players.each do |player|
          system "clear" unless system "cls"
          @game_set.to_s(@players)
          greet_player(player)
          player.query_next_direction(@game_set)
          if player_wins?(player)
            puts "Well done! You did it !"
            exit
          end
        end
      end
    end

    private
    def player_wins?(player)
      [player.x, player.y] == @game_set.get_finish_coordinates
    end

    def greet_player(player)
      puts "#{player.name.upcase}, please enter your direction:"
      puts Escape::Player::DIRECTIONS
    end
  end
end
