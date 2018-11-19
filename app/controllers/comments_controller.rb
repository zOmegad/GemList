class CommentsController < ApplicationController
	class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  	@comments = Comment.all
  end

  def show
  		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Post.find(params[:post_id]).comments.new
  end

  def edit
  	@post = Post.find(params[:post_id])
  end

  def create
    @comment = Post.find(params[:post_id]).comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(params[:post_id]) }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to post_path }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      @temparam = params.require(:comment).permit(:content,)
      @temparam.merge!(user_id: session[:user_id])
      return @temparam
    end
end
end
