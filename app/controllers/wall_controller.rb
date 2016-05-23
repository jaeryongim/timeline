class WallController < ApplicationController
  before_action :login_check, except: [:posts]

  def posts
    @posts = Post.all
  end

  def write
  end

  def write_complete
    p         = Post.new
    p.name    = params[:writer]
    p.content = params[:content]

    if p.save
      redirect_to '/wall/posts'
    else
      flash[:alert] = p.errors[:content].first
      redirect_to :back
    end
  end

  def write_comment
    @post_comment = Post.find(params[:id])
  end

  def write_comment_complete
    c = Comment.new
    c.post_id = params[:post_id]
    c.name    = params[:writer]
    c.content = params[:content]
    c.save
    redirect_to '/wall/posts'
  end


  def edit
    @post_edit = Post.find(params[:id])
  end

  def edit_complete
    p         = Post.find(params[:id])
    p.name    = params[:writer_edit]
    p.content = params[:content_edit]

    if p.save
      redirect_to '/wall/posts'
    else
      flash[:alert] = p.errors[:content].first
      redirect_to :back
    end
  end


  def delete
    @post_delete = Post.find(params[:id])
  end

  def delete_complete
    p = Post.find(params[:id])
    p.destroy

    redirect_to '/wall/posts'
  end
end

