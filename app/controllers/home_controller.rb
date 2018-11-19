class HomeController < ApplicationController
  def index
  	@posts = Post.all
  	@comments = Comment.all
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
