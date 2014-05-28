require 'spec_helper'

describe 'Posts home page:' do

	context 'When logged in:' do 

		before do
			user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'should display a message when no posts have been made' do
			visit '/posts'

			expect(page).to have_content 'No posts have been made'
		end
	end

end

describe 'Create a new post:' do

	context 'When logged out:' do

		it 'should take us to the sign up page' do
			visit '/posts'
			expect(current_path).to have_content '/users/sign_in'
			expect(page).to have_content 'You need to sign in or sign up before continuing'
		end

	end

	context 'When logged in' do

		before do
			user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'should add and display a post on the home page' do
			visit '/posts'
			path = Rails.root.join("app/assets/posts/image.jpeg")
			attach_file('post[picture]', path)
			click_button 'Upload'
			expect(page).to have_content 'Post uploaded successfully!'
		end
	end
end

describe 'deleting posts' do
	
	context 'my post' do

		before do
			user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			login_as user
			Post.create(description: 'Comment test')
		end

		it 'is removed from the posts page' do
			visit '/posts'
			expect(page).to have_content 'Comment test'

			click_button 'Delete post'
			expect(page).to have_content 'Deleted successfully!'
		end
	end
end








