require 'spec_helper'

describe 'writing comments' do 
	before do 
			user = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
			login_as user
			Post.create(description: 'Comment test')
		end

	specify 'a post has no comments when first uploaded' do
		visit '/posts'

		expect(page).to have_content '0 comments'
	end


	specify 'adding a comment to a post' do
		visit '/posts'
		click_link 'Add comment'

		fill_in 'Comment', with: 'This is a great snap'
		click_button 'Add comment'

		expect(current_path).to eq '/posts'
		expect(page).to have_content 'This is a great snap'

	end
end
