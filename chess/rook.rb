require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable
    def symbol
        "r"
    end

    private
    def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end
end