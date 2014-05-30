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
			visit '/posts/new'
			expect(current_path).to eq '/users/sign_in'
			expect(page).to have_content 'You need to sign in or sign up before continuing'
		end

	end

	context 'When logged in' do

		before do
			user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'should add and display a post on the home page' do
			visit '/posts/new'
			fill_in 'Description', with: 'This is a picture'
			path = Rails.root.join("app/assets/posts/image.jpeg")
			attach_file('Picture', path)
			click_button 'Upload'
			expect(page).to have_content 'Post uploaded successfully!'
			expect(page).to have_content 'This is a picture'
			expect(page).to have_css 'img.uploaded-pic'
		end
	end
end

describe 'deleting posts' do
	
	

	context 'my post' do

		before do
			ollie = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			scott = User.create(email: 'scott@scott.com', password: '12345678', password_confirmation: '12345678')
			login_as ollie	
			Post.create(description: 'Comment test', user: ollie)
		end

		
		it 'is removed from the posts page' do
			visit '/posts'
			expect(page).to have_content 'Comment test'
			click_link 'Delete post'
			expect(page).to have_content 'Deleted successfully!'
			expect(page).not_to have_content 'Comment test'
		end
	end

	context "someone else's post" do

		before do
			ollie = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			scott = User.create(email: 'scott@scott.com', password: '12345678', password_confirmation: '12345678')
			login_as ollie	
			Post.create(description: 'Comment test', user: scott)
		end


		it 'is not removed from the posts page and displays a message' do
			visit '/posts' 
			expect(page).not_to have_link "Delete post"
		end
	end
end








