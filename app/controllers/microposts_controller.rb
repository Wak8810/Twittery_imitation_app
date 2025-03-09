class MicropostsController < ApplicationController

  def show
    @micropost = Micropost.find(params[:id])
  end

  def index 
    @microposts = Micropost.order(id: :desc) #降順で並び替える
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to microposts_path
    else
      if @micropost.content.length <= 0
        flash[:danger] = "内容がありません"
      elsif @micropost.content.length > 140
        flash[:danger] = "140文字を超えています"
      end
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "Post Updated"
      redirect_to microposts_path
    else
      flash[:danger] = "140文字を超えています！"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_url, status: :see_other
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
