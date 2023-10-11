class ListsController < ApplicationController

  before_action :find_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
    
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      redirect_to root_path, notice: "list was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to root_path, notice: "list was successfully destroyed.", status: :see_other
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
