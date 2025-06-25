class Api::V1::PostsController < ApiController
    def index
    	@posts = Post.all

    	 # versioning serializer
        render json: @posts,
               each_serializer: Api::V1::PostSerializer,
               scope: current_user
    end

    def show
    	@post = Post.find_by(params[:id])

    	render json: @post,
    	       serializer: Api::V1::PostSerializer,
    	       scope: current_user
    end
end