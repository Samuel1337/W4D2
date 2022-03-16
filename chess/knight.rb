require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable
    def symbol
        "n"
    end

    protected
    def move_diffs
        row,col = pos
        [
            [row-1,   col-2],
            [row+1,   col-2],
            [row+2,   col-1],
            [row+2,   col+1],
            [row+1,   col+2], 
            [row-1,   col+2],
            [row-2,   col+1],
            [row-2,   col-1]
        ]
    end
end