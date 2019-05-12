module Escape
  # Public: general abstract Player
  class Player
    # Public: Returns the Strign name of the player.
    attr_reader :name
    # Public: Gets/Sets a players's coordinates.
    attr_accessor :x, :y

    # Public: Hash representation of available keyboard keys and directions.
    DIRECTIONS = {
                  left: 'j',
                  up:   'i',
                  right:'l',
                  down: 'k'
                  }


    # Public: Initialize a Player.
    #
    # name - A String naming the player.
    def initialize(name)
      @name = name
    end
  end
end
