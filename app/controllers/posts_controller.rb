class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to root_path
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def index
    query = params[:query]
    category = params[:category]
    @posts = Post.limit(10).order(created_at: :desc)
    @posts = @posts.where("title LIKE ?", "%#{query}%") if query.present?
    @posts = @posts.where(category: category) if category.present?
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.user == current_user
      @post.destroy
      flash[:notice] = '投稿が削除されました'
    end
    redirect_to root_path
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = '投稿しました'
      redirect_to root_path
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :content)
  end
end
