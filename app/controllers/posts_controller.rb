class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
  end

  def create
    binding.pry
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save

      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post updated successfully"
      redirect_to post_path(@post)
    else
      flash[:alerts] = "Please check your edits"
      render :edit
    end
  end

  def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :level, :comments, :city, :state, :date, :preference, :time, :age_group, :gender)
    end
end
