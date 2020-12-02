class PostsController < ApplicationController
  def index
    @post = Post.includes(:user).order("created_at DESC")

  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:image, :title, :genre_1_id, :genre_2_id, :shop_name, :explanation, :self_assessment_id).merge(user_id: current_user.id)
  end

end
