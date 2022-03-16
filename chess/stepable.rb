module Stepable
    
    def moves
        possible_moves = []

        move_diffs.each do |step_pos|

            if board.valid_pos?(step_pos)
                possible_moves << step_pos
            elsif board[pos].color != board[step_pos].color && board.inbound?(step_pos)
                possible_moves << step_pos
            end
        end

        possible_moves
    end

    private 

    def move_diffs

    end
end