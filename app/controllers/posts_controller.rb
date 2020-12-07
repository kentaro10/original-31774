class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :move_to_index, :destroy ]
  before_action :move_to_index, only: :edit
  def index
    @post = Post.includes(:user).order("created_at DESC") 
    @posts = Post.all.page(params[:page]).per(2).includes(:user).order("created_at DESC") 
    @users = User.all
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
  def edit
  end
  def update
    if @post.update(post_params)
      
    redirect_to post_path(params[:id])
    else
      render :edit
    end

  end

  def destroy
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end



  private

  def post_params
    params.require(:post).permit(:image, :title, :genre_1_id, :genre_2_id, :shop_name, :explanation, :self_assessment_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?  && current_user.id == @post.user_id 
      redirect_to action: :index
     end
  end

end
