require 'spec_helper'

describe Post do

	let (:post) {Post.create(description: 'Comment test')}

	describe '#tag_names=' do
		describe 'no tags' do
			it 'does nothing' do
				post.tag_names = ''
				expect(post.tags).to be_empty
			end
		end

		describe 'one tag' do
			it 'has one tag' do
				post.tag_names = 'first'
				expect(post.tags.count).to eq 1
			end

		end
	end
end
