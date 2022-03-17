require_relative 'cursor'
require_relative 'board'
require 'colorize'

class Display

    attr_accessor :cursor, :board

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0],@board)
        render
    end

    def render
        board[cursor.cursor_pos].symbol.colorize(:color => :red, :background => :red)    
    end

    def play
        while true
            render
            cursor.get_input 
        end
    end




end

display = Display.new
display.play