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

			it 'prepends the tag with a #' do
				post.tag_names = 'anything'
				expect(post.tags.last.name).to eq '#anything'
			end


			it 'does not double up #s' do
				post.tag_names = '#anything'
				expect(post.tags.last.name).to eq '#anything'
			end

		describe 'multiple comma-separated tags' do
			it 'adds each tag to the post' do
				post.tag_names = 'yippee, kai'
				expect(post.tags.count).to eq 2
			end
		end


		end
	end
end
