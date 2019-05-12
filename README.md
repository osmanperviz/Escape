# Labyrinth console application

The 2D maze game can be played with one or more players. The first player to get to the exit wins.

The maze is read from a text file to put in the project root (see `eccape.txt` file as an example). The maze is composed of cells. Every cell has its coordinates (0,0) being defined in the upper left corner. The start cell is marked with letter 'S', the finish (exit) cell is marked with the 'F' one. The walls are marked with the dash '#' sign.

The game is played from the command line in turn, and the maze is refreched after every go and displays each player's position. A player's position is indexed starting from 0 (zero) and so on. If a player tries to move against a wall, he will stay where he is and keep his previous coordinates.

## Available keyboard keys to move

- **j** - LEFT
- **i** - UP
- **l** - RIGHT (downcased L)
- **k** - DOWN

## Available players

- Human Player
- Random Player

## Human Player

The player is moving with the help of human which will define the best strategy and direction to move to be the first to get the finish cell.

## Random Player

The player moves absolutely in a random way.

Actually players (their type and names) are hard-coded in the Escape::Support.create_player method.

To start up the maze, just run from the project root:

```
ruby bin/play.rb {maze_text_file}
```
