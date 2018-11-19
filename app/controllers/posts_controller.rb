class PostsController < ApplicationController
	load_and_authorize_resource

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comments = Comment.all
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create

		@post = Post.new(post_params)
		@post.save
		puts 'le post :'
		print @post[:title]
		respond_to do |format|
				format.html { redirect_to "posts/show/", notice: 'Post has been created.' }
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)	
			respond_to do |format|
				format.html { redirect_to post_path(@post), notice: 'Post has been updated.'}
			end
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.present
			@gpost.destroy
		    respond_to do |format|
		    	format.html { redirect_to "/", notice: 'Post has been destroyed.'}
		    end
		end	
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    	def set_post
      		@post = Post.find(params[:id])
    	end

    # Never trust parameters from the scary internet, only allow the white list through.
    	def post_params
    		#je push le user id dans mon hash
      		temp_params = params.require(:post).permit(:title, :content, :user_id)
      		temp_params.merge!(user_id: session[:user_id])
      		print temp_params
      		return temp_params
    	end
end
