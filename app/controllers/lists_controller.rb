class ListsController < ApplicationController
  before_action :set_list, only:[:show, :edit, :update, :destroy]
  before_action :set_board 
  
  def index
    # @lists = @board.lists
    @lists = List.all_lists
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    # @list = @board.lists.new(list_params)
    List.create_list(list_params, @board.id)
    redirect_to board_lists_path(@board)
  end

  def edit
  end

  def update
    List.update_list(list_params, @list.id)
    redirect_to board_list_path(@board, @list)

  end

  def destroy
    List.delete_list(@list.id)
    redirect_to board_lists_path(@board)
  end

  private
  def set_board
    # @board = Board.find(params[:board_id])

    @board = Board.single_board(params[:board_id])
  end

  def set_list
    @list = List.get_list(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :board_id)
  end


end
