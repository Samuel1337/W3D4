require_relative "tile"

class Board

    VALUES = ["bomb", "safe"]
    @@array_values = []
    81.times {@@array_values << VALUES.sample }
    
    attr_reader :grid


    def initialize
        @grid = Array.new(9) {Array.new(9) { Tile.new(@@array_values.shift) } }
    end

    def render 
        @grid.each do |row|
            display = row.map { |tile| tile.revealed == true ? ( tile.value == "bomb" ? "*" : "_" ) : " " }
            puts display.join(" ")
        end
    end

    def [](pos)
        x, y = pos
        grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        tile = grid[x][y]
        tile.value = val
    end

    def adjacent_bombs(pos)
        row, col = pos
        prev_row = grid[row-1][col-1..col+1].count { |tile| tile != nil && tile.value == "bomb" }
        same_row = grid[row][col-1..col+1].count { |tile| tile != nil && tile.value == "bomb" }
        next_row = grid[row+1][col-1..col+1].count { |tile| tile != nil && tile.value == "bomb" }
        
        puts prev_row + same_row + next_row
    end


    # pos x-1, y
    # pos x-1, y+1
    # pos x-1, y-1
    # pos x, y-1
    # pos x, y+1
    # pos x+1, y+1
    # pos x+1, y-1
    # pos x+1, y
end

