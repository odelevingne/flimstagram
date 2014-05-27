require 'spec_helper'

describe 'post index page' do

	context 'logged in' do 

		before do
			user = User.create(email: 'ollie@ollie.com', password: 'hello', password_confirmation: 'hello')
			login_as user
		end

		it 'should display a message when no posts have been made' do
			visit '/posts'

			expect(page).to have_content 'No posts have been made'
		end
	end
end


describe 'creating a new post' do

	context 'logged out' do

		it 'should take us to the sign up page' do
			visit '/posts'
			expect(current_path).to have_content '/users/sign_in'
			expect(page).to have_content 'You need to sign in or sign up before continuing'
		end
	end

	context 'adds post to the post index' do

		xit'should display a post on the index page' do
			visit '/posts'
			path = "/Users/OliverDelevingne/Projects/flimstagram/flimstagram/app/assets/posts/image.jpeg"
			attach_file('file', path)
			click_button 'Upload'
			expect(page).to have_content 'Post uploaded successfully!'
		end
	end
end

describe 'logging in' do
	xspecify 'a user can log in' do
		visit '/posts'

		expect
	end
end
