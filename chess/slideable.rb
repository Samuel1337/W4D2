
module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [[1,0], [0,1], [0,-1],[-1,0]]
    DIAGONAL_DIRS = [[1,1],[-1,1],[1,-1],[-1,-1]]
    
    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end
    
    def moves
        possible_moves = []
        move_dirs.each do |vector|
            dx, dy = vector
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        possible_moves
    end
    
    private
    def move_dirs
         
    end
                                     
    def grow_unblocked_moves_in_dir(dx,dy) 
        row,col = pos                     
        new_row = row + dx
        new_col = col + dy
        slide_pos = [new_row, new_col]
        unblocked_moves = []

        while board.valid_pos?(slide_pos)
            
            slide_pos = [new_row, new_col]
            
            unblocked_moves << slide_pos

            new_row += dx
            new_col += dy
        end

        unblocked_moves
    end
end