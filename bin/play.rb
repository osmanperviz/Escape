$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'escape'

# Entry point of the application

# To start, run from the project root as:
# ruby bin/play.rb {maze_text_file}

# Example

# ruby bin/play.rb escape.txt

# First reads the text file to initilize the maze.
# Then create players.
# And displays the created maze with a greeting for the first player

file_name = ARGV.pop || ''
raise "Escape file #{file_name}is not found!" unless File.exists?(file_name)
game_set = Escape::GameSet.new(file_name)
puts "Welcome to the Labyrinth"

players = Escape::Support.create_players
Escape::Support.set_on_start(players, game_set.get_start_coordinates)
engine = Escape::Engine.new(game_set, players)
engine.run
