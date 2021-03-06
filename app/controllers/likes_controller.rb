 class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find params[:post_id]
		@post.likes.create(user: current_user)
		WebsocketRails[:likes].trigger 'new', { id: @post.id, new_like_count: @post.likes.count }
		render nothing: true
	end

	def destroy 
		@post = Post.find(params[:post_id])
		@like = @post.likes.find_by(user_id: current_user.id)
		@like.destroy
		WebsocketRails[:likes].trigger 'destroy', { id: @post.id, new_like_count: @post.likes.count }
		render nothing: true
		# redirect_to '/posts'
	end



end
