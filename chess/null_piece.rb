class NullPiece < Piece
    
    include Singleton
    def initialize
        @color
        @symbol
    end
    def to_s
        return ' '
    end

end