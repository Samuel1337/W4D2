require_relative 'piece'
require_relative 'stepable'

class Pawn < Piece
    include Stepable
    def symbol
        "p"
    end

    def moves 
        possible_moves = []
        row,col = pos

        forward_steps.each do |step_pos|
            possible_moves << step_pos if board[step_pos].empty? && board.inbound?(step_pos)
        end
        
        side_attacks.each do |attack_pos|
            a_row, a_col = attack_pos
            if !board[attack_pos].empty? && board[pos].color != board[attack_pos].color
                possible_moves << attack_pos if inbound?(attack_pos)
            end
        end

        possible_moves
    end

    private
    def at_start_row?
        row,col = pos
        color == :black && row == 1 || color == :white && row == 6
    end

    def forward_dir
        color == :white ? -1 : 1
    end
    
    def forward_steps
        dx = forward_dir
        row,col = pos
        at_start_row? ? [[row + dx, col],[row + dx*2, col]] : [[row + dx, col]]
    end

    def side_attacks
        dx = forward_dir
        row,col = pos
        [ [row + dx, col - 1], [row + dx, col + 1] ]
    end
end