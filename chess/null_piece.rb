require_relative "piece"
require "singleton"

class NullPiece < Piece
    
    include Singleton
    def initialize
    end
    
    def moves
        raise NotImplementedError
    end

    def symbol
        ' '
    end

    def empty?
        true
    end

end