class BoardsController < ApplicationController
 before_action :set_board, only:[:show, :edit, :update, :destroy]
 
  def index
    # @boards = Board.all
    @boards = Board.all_boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    Board.create_board(board_params)
    redirect_to boards_path
  end

  def edit
    render partial: "form"
  end

  def update
    Board.update_board(board_params, @board.id)
      redirect_to boards_path
  end

  def destroy
    Board.delete_board(@board.id)
    redirect_to boards_path
  end


  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
    # @board = Board.find(params[:id])
    @board = Board.single_board(params[:id])

  end
end
