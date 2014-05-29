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
		
		# @post = current_user.posts.find(params[:id]) is used in place of:
		# "@post = Post.find(params[:id])
		# if @post.user == current_user
		# else" because it does not retrieve the record from the database and is more robust.
		# This would become increasingly important in complex actions where we want to prevent
		# the record being retrieved at all.
		@post = current_user.posts.find(params[:id])
		@post.delete
		flash[:notice] = 'Deleted successfully!'
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = 'This is not your post!'
	ensure 
		redirect_to '/posts'
	end
end
