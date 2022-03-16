require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable
    def symbol
        "q"
    end

    private
    def move_dirs
        DIAGONAL_DIRS
    end
end