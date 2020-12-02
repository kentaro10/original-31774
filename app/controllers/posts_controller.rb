class PostsController < ApplicationController
  def index

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
  end


  private

  def post_params
    params.require(:post).permit(:image, :title, :genre1_id, :genre2_id, :shop_name, :explanation, :self_assessment_id).merge(user_id: current_user.id)
  end

end
