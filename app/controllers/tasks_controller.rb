class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  before_action :set_list
  
  def index
    @tasks = List.all_tasks(@list.id)
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    Task.create_task(task_params, @list.id)
      redirect_to board_list_path(@list.board_id,@list)
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to board_list_path(@list.board_id,@list)
    else
      render :edit
    end
  end


  def destroy
    Task.delete_task(@task.id)
    redirect_to board_list_path(@list.board_id,@list)
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description, :due, :tags)
  end

  def set_task
    @task = Task.get_task(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_board
    @board = Board.find(@list.board_id).inspect
  end
end
