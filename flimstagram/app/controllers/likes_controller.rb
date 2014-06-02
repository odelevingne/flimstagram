class LikesController < ApplicationController

	def create
		@post = Post.find params [:id]
		@post.likes.create
		redirect_to '/posts'
	end

end
