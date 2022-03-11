require_relative "board"
require_relative "tile"

class Game

    attr_reader :board, :game_over

    def initialize
        @board = Board.new
        @game_over = false
    end

    def check_pos(pos)
        board[pos].reveal
        board.render
        if board[pos].value == "bomb"
            puts "BOOM! You lose the game"
            @game_over = true
        else
            board[pos] = board.adjacent_bombs(pos)
        end
    end 

    def parse_pos(str)
        str.split(",").map {|char| Integer(char)}
    end

    def run

        while game_over == false
            puts "choose a pair of coordinates like f 3,5"
            cmd, parse_pos(response) = gets.chomp.split(" ")
            

        end

    end
end

game = Game.new
game.check_pos([1,1])

