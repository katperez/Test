require 'spec_helper'

describe "Resetting Password" do

	it "reset password" do
		User.destroy_all
		signup("jim@jimvanfleet.com")
		logout
		click_link "Sign In"
		click_link "Forgot your password?"
		fill_in "Email", :with => "jim@jimvanfleet.com"
		click_button "Send me reset password instructions"
		save_and_open_page
		open_email ("jim@jimvanfleet.com")
		current_email.save_and_open
		current_email.click_link 'Change my password'
		fill_in "New password", :with => "katherine"
		fill_in "Confirm new password", :with => "katherine"
		click_button "Change my password"
		expect(page).to have_content("successful")
		click_link "Sign Out"
		click_link "Sign In"
		save_and_open_page	
		fill_in "Email", :with => "jim@jimvanfleet.com"
		fill_in "Password", :with => "katherine"
		click_button "Sign in"
		expect(page).to have_content("successful")
		save_and_open_page	
	end
end
