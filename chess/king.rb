require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable
    def symbol
        "K"
    end

    protected
    def move_diffs
        row,col = pos
        [
            [row-1,   col],
            [row+1,   col],
            [row-1,   col-1],
            [row+1,   col-1],
            [row-1,   col+1], 
            [row+1,   col+1],
            [row,     col-1],
            [row,     col+1]
        ]
    end
end