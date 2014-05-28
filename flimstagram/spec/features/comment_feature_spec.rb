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
end
