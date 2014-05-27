require 'spec_helper'

describe 'post index page' do
	context 'no posts have been made' do
		it 'should display a message' do
			visit '/posts'

			expect(page).to have_content 'No posts have been made'
		end
	end
end


describe 'creating a new post' do
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