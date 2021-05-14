class ListsController < ApplicationController
  def home
    redirect_to lists_path
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    # @bookmarks = Bookmarks.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.valid?
      @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def params_list
    params.require(:list).permit(:name, :photo)
  end
end
