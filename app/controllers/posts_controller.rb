class PostsController < ApplicationController
    
  def index  
    @posts = Post.all
  end

  def show 
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new # 空の予定
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      flash[:notice] = "予定を作成しました"
      redirect_to action: :index
    else   
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end
    
  def update  
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "予定を編集しました"
      redirect_to action: :index
    else
      render :edit, status: :unprocessable_entity
    end
  end

    
  def destroy  
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "予定を削除しました"
      redirect_to action: :index
    end
  end

  private
  def post_params 
    params.require(:post).permit(
    :title,
    :body,
    :start_date,
    :end_date,
    :all_day
    )
  end
end