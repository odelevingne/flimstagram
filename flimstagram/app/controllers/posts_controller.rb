class PostsController < ApplicationController

	def index
		authenticate_user!
	end

	def create
		redirect_to '/posts'
	end

end
