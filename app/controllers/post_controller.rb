class PostController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to :show
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.like_post
    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id)
  end

end
