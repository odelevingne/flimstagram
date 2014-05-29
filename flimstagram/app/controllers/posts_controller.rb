class PostsController < ApplicationController

	before_action :authenticate_user!

	def index
		@all_posts = Post.all
		@post = Post.new
	end

	def new
		@post = Post.new
	end

	def create
		# upload file
		@post = Post.new(params['post'].permit(:picture, :description))
		@post.user = current_user
		if @post.save!
			flash[:notice] = 'Post uploaded successfully!'
			redirect_to '/posts'
		else
			flash[:notice] = 'Error: file is not valid!'
			render 'index'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.delete
		flash[:notice] = 'Deleted successfully!'
		redirect_to '/posts'
	end



end
