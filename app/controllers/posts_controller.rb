class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :move_to_index, :destroy ]
  before_action :move_to_index, only: :edit
  def index
    @post = Post.includes(:user).order("created_at DESC") 
    @posts = Post.all.page(params[:page]).per(8).includes(:user).order("created_at DESC") 
    @users = User.all
    @post_genre_1_2 = Post.where(genre_1_id: 2).limit(4).order("id": "desc")
    @post_genre_1_3 = Post.where(genre_1_id: 3).limit(4).order("id": "desc")
    @post_genre_1_4 = Post.where(genre_1_id: 4).limit(4).order("id": "desc")
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

  def genre_1
    @post = Post.find_by(genre_1_id: params[:id])
    @posts = Post.where(genre_1_id: params[:id]).order('created_at DESC')
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
