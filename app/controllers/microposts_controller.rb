class MicropostsController < ApplicationController

  def show
    @micropost = Micropost.find(params[:id])
  end

  def index 
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to microposts_path
    else
      flash[:danger] = "No Content"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
