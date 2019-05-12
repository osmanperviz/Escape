module Escape
  class GameSet
    # Public: Returns the Hash representation of the maze.
    # key - cell coordinates.
    # value - Cell object.
    attr_reader :matrix

    # Public: Initialize a GameSet.
    #
    # file_name - A String naming the file name.
    def initialize(file_name)
      @file_name = file_name
      init_matrix(file_name)
    end

    # Public: String representation of the maze.
    # Reads a maze text file, creates a Hash containing the maze.
    # Assigns Cell coordinates as Hash key, and Cell object as value.
    #
    # players - arrays of players.
    #
    # Returns String represenation of the maze as output to the console.
    def to_s(players = [])
      File.open(@file_name).readlines.each_with_index do |line, line_index|
        line.chars.each_with_index do |char, char_index|
          x, y = char_index, line_index
          players.each_with_index do |player, index|
            if char == Cell::TYPES[:start]
              break
            end
            char = index.to_s if cell_occupied_by?(player, x, y)
          end
          print char
          @matrix[[x, y]] = Cell.new(char)
        end
      end
      #Adding an empty line after printing the labyrinth.
      puts
    end

    #Public: Checks if the Cell with supplied coordinates is accessible.
    #
    # x - x coordinate.
    # y - y coordinate.
    # Returns true if the cell is not a wall.
    def is_accessible?(x, y)
      cell = @matrix[x, y]
      cell.type != Cell::TYPES[:wall]
    end

    # Public: Sends start coordinates.
    #
    # Examples:
    # get_start_coordinates
    # # => [1, 12]
    #
    # Returns array of Integer.
    def get_start_coordinates
      start = @matrix.select { |k, v| v.type.eql?(Cell::TYPES[:start])}
      raise "Start case not found" unless start
      start.keys.first
    end

    # Public: Sends finish coordinates.
    #
    # Examples:
    # get_finish_coordinates
    # # => [1, 12]
    #
    # Returns array of Integer.
    def get_finish_coordinates
      finish = @matrix.select { |k, v| v.type.eql?(Cell::TYPES[:finish])}
      raise "Finish case not found" unless finish
      finish.keys.first
    end

    private
    def init_matrix(file_name)
      @matrix = {}
      File.open(file_name).readlines.each_with_index do |line, line_index|
        line.chars.each_with_index do |char, char_index|
          @matrix[[line_index, char_index]] = Cell.new(char)
        end
      end
      @matrix
    end

    # Sends true if a player occupies the cell at x, y
    def cell_occupied_by?(player, x, y)
      player.x == x && player.y == y
    end

  end
end
