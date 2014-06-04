require 'spec_helper'

describe 'Liking a post:' do

	context 'Logged in:' do

		let(:user2) { User.create(email: 'scott@scott.com', password: '12345678', password_confirmation: '12345678') }
	
			before do 
				user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
				login_as user
				Post.create(description: 'Test', user: user, tag_names: 'test, tags')
			end

			specify 'a post has no likes when first created' do
				visit '/posts'

				expect(page).to have_content "♥ 0"
			end

			specify 'when a user clicks the like button it registers a like' do
				visit '/posts'

				click_link '♥ 0'
				expect(page).to have_content '♥ 1'

			end

			specify 'a user can undo a like' do
				
				visit '/posts'

				click_link '♥ 0'
				click_link '♥ 1'

				expect(page).to have_content('♥ 0')
			end

			specify "a user can see another user's like" do

				visit '/posts'

				click_link '♥ 0'

				logout(:user)

				login_as user2

				expect(page).to have_content '♥ 1'
			end

			specify 'a user can like a post that has been liked by another user' do
				visit '/posts'

				click_link '♥ 0'
				sleep 1
				logout(:user)

				login_as user2

				visit '/posts'
				click_link '♥ 1'

				expect(page).to have_content '♥ 2'
			end
	end

	context 'Logged out:' do

		before do 
			user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			login_as user
			Post.create(description: 'Test', user: user, tag_names: 'test, tags')
		end

		xspecify 'you can only like a post if logged in' do

			visit '/posts'

			click_link '♥ 0'

			expect(page).to have_link '♥ 1'

			logout(:user)

			expect(page).not_to have_link '♥ 1'
		end
	end
end