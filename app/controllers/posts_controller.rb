class PostsController < ApplicationController

	def index
	    @posts = Post.includes(:user).all

	    render json: @posts,
	           each_serializer: PostSerializer,
	           scope: current_user,
	           meta: { total: @posts.count },
	           root: "posts"
	end

	def show 
	   post = Post.find_by(id: params[:id])
	   render json: post, serializer: PostSerializer, scope: current_user
	end
end