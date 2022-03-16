# require 'colorize'

class Piece
    
    attr_accessor :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
       "#{symbol}"
    end
    
    def empty?
        false
    end
    
    def valid_moves(end_pos)
        x, y = end_pos
        return false if !x.between?(0,7) || !y.between?(0,7)
        return true
    end

    def symbol
        raise NotImplementedError
    end

    def moves
        raise NotImplementedError
    end

    def move_dirs
        raise NotImplementedError
    end

    private
    def move_into_check?(end_pos)

    end
end