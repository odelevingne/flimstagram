require 'spec_helper'

describe 'tagging posts' do
	before do
		ollie = User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')
		login_as ollie
	end

	it 'displays the tags on the posts page' do
		visit '/posts/new'
		fill_in 'Description', with: 'My new post'
		path = Rails.root.join("app/assets/posts/image.jpeg")
		attach_file('Picture', path)
		fill_in 'Tags', with: 'lol, spiffing'
		click_button 'Upload'

		expect(page).to have_link '#lol'
		expect(page).to have_link '#spiffing'
	end

	xit 'can filter posts by tag' do
		Post.create(description: 'Test1', tag_names: 'yippee')
		Post.create(description: 'Test2', tag_names: 'kai')

		visit'/posts'
		click_link '#yippee'
		expect(page).to have_content 'Test1'
		expect(page).not_to have_content 'Test2'
	end
end