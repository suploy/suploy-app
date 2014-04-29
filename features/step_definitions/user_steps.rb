include Warden::Test::Helpers
Warden.test_mode!

Given /a test user exists/ do
	user = User.new({name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test'})
	user.confirmation_sent_at = Time.now
	user.skip_confirmation!
	user.save!(:validate => false)
end

Given /I supply my user information/ do
	fill_in 'user_name', with: 'testuser'
	fill_in 'user_email', with: 'test@example.com'
	fill_in 'user_password', with: 'q1w2f3p4g5'
	fill_in 'user_password_confirmation', with: 'q1w2f3p4g5'
end

Given /I am logged in/ do
	visit path_to('the login page')
	fill_in 'user_login', with: 'test'
	fill_in 'user_password', with: 'test'
	click_button 'Sign in'
end

When /I enter a new password "([^\"]*)"/ do |password|
	fill_in 'user_password', with: password
	fill_in 'user_password_confirmation', with: password
end

When /confirm with my password "([^\"]*)"/ do |password|
	fill_in 'user_current_password', with: password
end

When /logout/ do
	logout(:user)
end

Then /I can login with the password: "([^\"]*)"/ do |password|
	visit path_to('the login page')
	fill_in 'user_login', with: 'test'
	fill_in 'user_password', with: password
	click_button 'Sign in'
end

Then /confirm to delete/ do

end

Then /I am logged off/ do

end

Then /can't login/ do

end

Then /I receive an email with a verification link/ do
	email = ActionMailer::Base.deliveries.last
	email.to.should == ["test@example.com"]
	email.body.should include('confirmation')
end
