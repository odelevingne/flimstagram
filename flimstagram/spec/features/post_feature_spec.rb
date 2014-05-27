require 'spec_helper'

describe 'post index page' do
	context 'no posts have been made' do
		it 'should display a message' do
			visit '/posts'

			expect(page).to have_content 'No posts have been made'
		end
	end
end
