require_relative 'piece'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'pawn'
require_relative 'queen'
require_relative 'king'
require_relative 'null_piece'
require "byebug"

class Board
    attr_reader :rows, :pieces 
    
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        
        @pieces = %w(rook knight bishop king queen pawn) 
        
        setup_board
    end
    
    def setup_board

        queue = %w(rook knight bishop king queen bishop knight rook) + 
                ["pawn"]*8 + [nil] * 8 * 4 + ["pawn"]*8 + %w(rook knight bishop king queen bishop knight rook)

        (0..7).each do |idx|
            (0..7).each do |jdx|
                color = (idx < 5 ? :black : :white)
                rows[idx][jdx] = add_piece(queue.shift, color, [idx,jdx])
            end
        end

        (2..5).each {|i| rows[i] = [NullPiece.instance]*8}

    end

    def add_piece(piece, color, pos)

        return Rook.new(color,self,pos)    if piece == "rook"
        return Knight.new(color,self,pos)  if piece == "knight"
        return Bishop.new(color,self,pos)  if piece == "bishop"
        return Queen.new(color,self,pos)   if piece == "queen"
        return King.new(color,self,pos)    if piece == "king"
        return Pawn.new(color,self,pos)    if piece == "pawn"
        return NullPiece.instance          if piece == nil
    end

    def render
        display_board = rows.dup
        display_board.each { |row| puts row.map {|ele| ele.to_s}.join(" ") }
    end

    def [](pos)
        row,col = pos
        rows[row][col] 
    end
    
    def []=(pos,val)
        row,col = pos
        rows[row][col] = val
    end
    
    def inbound?(pos)
        row,col = pos
        row.between?(0,7) && col.between?(0,7)
    end

    def valid_pos?(start_pos)
        row,col = start_pos
        return false if !inbound?(start_pos)
        piece = rows[row][col]
        return piece.empty? || piece.color != self[start_pos].color
    end

    def checkmate?(color)

    end

    def in_check?(color)
        
    end

    def find_king(color)

    end

    def pieces 
        @pieces
    end

    def dup 
        self.dup
    end

    def move_piece!(start_pos,end_pos)
      
        piece = self[start_pos]
        if piece.moves.include?(end_pos)
            self[end_pos] = piece
            piece.pos = end_pos
            self[start_pos] = NullPiece.instance
        else
            raise "Invalid Position OH NO!" 
        end
        render
    end
end

b = Board.new
b.render
b.move_piece!([1,3],[3,3])
b.move_piece!([0,4],[3,1])
b.move_piece!([0,1],[2,2])
b.move_piece!([3,1],[6,1])