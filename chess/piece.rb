class Piece
    
    attr_reader :name, :start_pos
    attr_accessor :pos
    def initialize(name,start_pos)
        @name = name
        @start_pos = start_pos
        @pos = @start_pos
        
    end

    def to_s
        return " " if name == nil
        return 'b' if name.include?('bishop')
        return 'r' if name.include?('rook')   
        return 'n' if name.include?('knight') 
        return 'K' if name.include?('king')   
        return 'p' if name.include?('pawn')
        return 'q' if name.include?('queen')  
    end

    def moves
        
    end

end