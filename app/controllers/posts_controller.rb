class PostsController < ApplicationController
  def index
    @featured = Post.order(:created_at).last
    @posts = Post.all.where.not(id: @featured.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post Successfully Created"
      redirect_to posts_path
    else
      flash[:error] = "Please Try Again"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post Successfully Updated"
      redirect_to post_path(@post)
    else
      flash[:error] = "Please Try Again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post Successfully Deleted"
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :author, :content, :image)
  end
end
