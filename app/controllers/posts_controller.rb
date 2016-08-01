class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post Created!"
      redirect_to post_path
    else
      flash[:alert] = "Failed to Create Post"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post Updated!"
      redirect_to post_path
    else
      flash[:notice] = "Failed to update post"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "Post deleted!"
      redirect_to home_index_path
    else
      flash[:alert] = "Failed to delete post"
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :number)
  end
end