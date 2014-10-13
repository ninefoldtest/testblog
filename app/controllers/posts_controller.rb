class PostsController < ApplicationController
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
    @post = Post.new(params[:post])
    @post.user = @authenticated

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

    if @post.user_id != @authenticated.id
      redirect_to post_path(@post)
    end

    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != @authenticated.id
      redirect_to post_path(@post)
    else
      @post.destroy
    end
    redirect_to root_path
  end

end
