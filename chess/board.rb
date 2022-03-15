require_relative 'piece'

class Board
    attr_reader :rows, :black_pieces_main_row, :black_pieces_pawn_row, :white_pieces_main_row, :white_pieces_pawn_row
    
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        
        @black_pieces_main_row = ['b_r_rook', 'b_r_knight', 'b_r_bishop', 'b_king', 'b_queen', 'b_l_bishop', 'b_l_knight', 'b_l_rook']
        @black_pieces_pawn_row = ['b_pawn_1', 'b_pawn_2', 'b_pawn_3', 'b_pawn_4', 'b_pawn_5', 'b_pawn_6', 'b_pawn_7', 'b_pawn_8']

        @white_pieces_main_row = ['w_l_rook', 'w_l_knight', 'w_l_bishop', 'w_king', 'w_queen', 'w_r_bishop', 'w_r_knight', 'w_r_rook']
        @white_pieces_pawn_row = ['w_pawn_1', 'w_pawn_2', 'w_pawn_3', 'w_pawn_4', 'w_pawn_5', 'w_pawn_6', 'w_pawn_7', 'w_pawn_8']
        
        setup_board
    end
    
    def setup_board

        queue = black_pieces_main_row + black_pieces_pawn_row + [nil] * 8 * 4 + black_pieces_pawn_row + white_pieces_main_row

        (0..7).each do |idx|
            (0..7).each do |jdx|
                rows[idx][jdx] = Piece.new(queue.shift,[idx,jdx])
            end
        end

    end

    def render
        display_board = rows.dup
        display_board.each { |row| puts row.map {|ele| ele.to_s}.join(" ") }
    end

    def [](pos)
        rows[pos[0]][pos[1]] 
    end
    
    def []=(pos,val)
        rows[pos[0]][pos[1]] = val
    end
    
    def valid_pos?(start_pos)
        !rows[start_pos].name.nil?
    end

    def valid_move?(end_pos)
        x, y = end_pos
        return false if !x.between?(0,7) || !y.between?(0,7)
        return true
    end

    def move_piece(start_pos,end_pos)
        # raise "Invalid Pos" if !valid_pos?(start_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = Piece.new(nil, start_pos)
        render
    end
end


# w_l_rook   = Piece.new('w_l_rook')
# w_l_bishop = Piece.new('w_l_bishop')
# w_l_knight = Piece.new('w_l_knight')
# w_r_rook   = Piece.new('w_r_rook')
# w_r_bishop = Piece.new('w_r_bishop')
# w_r_knight = Piece.new('w_r_knight')
# w_queen    = Piece.new('w_queen')
# w_king     = Piece.new('w_king')
# w_pawn_1   = Piece.new('w_pawn_1')
# w_pawn_2   = Piece.new('w_pawn_2')
# w_pawn_3   = Piece.new('w_pawn_3')
# w_pawn_4   = Piece.new('w_pawn_4')
# w_pawn_5   = Piece.new('w_pawn_5')
# w_pawn_6   = Piece.new('w_pawn_6')
# w_pawn_7   = Piece.new('w_pawn_7')
# w_pawn_8   = Piece.new('w_pawn_8')
# b_l_rook   = Piece.new('b_l_rook')
# b_l_bishop = Piece.new('b_l_bishop')
# b_l_knight = Piece.new('b_l_knight')
# b_r_rook   = Piece.new('b_r_rook')
# b_r_bishop = Piece.new('b_r_bishop')
# b_r_knight = Piece.new('b_r_knight')
# b_queen    = Piece.new('b_queen')
# b_king     = Piece.new('b_king')
# b_pawn_1   = Piece.new('b_pawn_1')
# b_pawn_2   = Piece.new('b_pawn_2')
# b_pawn_3   = Piece.new('b_pawn_3')
# b_pawn_4   = Piece.new('b_pawn_4')
# b_pawn_5   = Piece.new('b_pawn_5')
# b_pawn_6   = Piece.new('b_pawn_6')
# b_pawn_7   = Piece.new('b_pawn_7')
# b_pawn_8   = Piece.new('b_pawn_8')

b = Board.new
b.render
b.move_piece([6,3],[4,3])