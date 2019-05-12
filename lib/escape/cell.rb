module Escape
  # Public: Maze cell object.

  class Cell
    # Public: Gets/Sets the String type of the cell.
    attr_accessor :type

    #Public: Hash representing the Cell types.
    TYPES = {
      empty:  ' ',
      wall:   '#',
      start:  'S',
      finish: 'F'
    }
    # Public: Initialize a Cell.
    #
    # type - A String indicating the cell type.
    def initialize(type = TYPES[:empty])
      @type = type
    end

    # Public: Indicates if the cell is accessible.

    # Retuns true if the cell is not a wall.
    def is_accessible?
      type != TYPES[:wall]
    end

    # Public: Indicates if the cell is a start one.
    #
    # Returns true if the cell is a start one.
    def is_start?
      type == TYPES[:start]
    end

    # Public: Indicates if the cell is the finish one.
    #
    # Returns true if the cell is a finish one.
    def is_finish?
      type == TYPES[:finish]
    end

    # Public: Textual reresentation of the cell.
    #
    # Returns the String type of the cell.
    def to_s
      TYPES[type.to_sym]
    end
  end
end
