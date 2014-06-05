require 'spec_helper'

describe 'Orders page:' do
	let(:post) 	{ 	Post.create(description: 'Test order - lovely snap') 																							}
	let(:user) 	{ 	User.create(email: 'ollie@ollie.com', password: '12345678', password_confirmation: '12345678')		}
	let(:admin) { 	Admin.create(email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678') 	}

	context 'logged in as admin:' do

		before do
			login_as admin, scope: :admin
		end

		context 'no orders:' do

			specify 'when there are no orders a message shows' do
				visit '/orders'
				expect(page).to have_content 'No orders have been placed'
			end
		end
	end

	context 'not logged in as admin:' do
		it 'will prompt you to sign in' do
			visit '/orders'

			expect(page).to have_content 'Sign in'
		end
	end

	context 'with orders:' do
		before do
			christmas_day = Date.new(2013, 12, 25)

			login_as admin, scope: :admin
			Order.create(id: 1, post: post, user: user, created_at: christmas_day)
			visit '/orders'
		end

		it 'displays the product ordered' do
			expect(page).to have_content 'Test order - lovely snap'
		end

		it 'displays the customer email' do
			expect(page).to have_content 'ollie@ollie.com'
		end

		it 'displays an order number' do
			expect(page).to have_content '2512130001'
		end
	end

end