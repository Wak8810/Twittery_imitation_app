class MicropostsController < ApplicationController

  def show
    @micropost = Micropost.find(params[:id])
  end

  def index 
    @microposts = Micropost.order(updated_at: :desc) #降順で並び替える
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_path
    else
      if @micropost.content.length > 140
        flash[:danger] = "140文字を超えています"
      else
        flash[:danger] = "内容がありません"
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
      flash[:success] = "更新しました"
      redirect_to root_path
    else
      if @micropost.content.length > 140
        flash[:danger] = "140文字を超えています"
      else
        flash[:danger] = "内容がありません"
      end
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to root_path, status: :see_other
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
