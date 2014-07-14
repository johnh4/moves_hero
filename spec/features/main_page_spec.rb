require "rails_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "Initial page load" do
	before do
		visit '/'
	end
	scenario "displays the correct links" do
		expect(page).to have_link("Sign In")
		expect(page).to have_link("Sign Up")
		expect(page).not_to have_link("Sign Out")
	end
	feature "Sign up" do
		before do
			click_link "Sign Up"
			fill_in "Email", with: "text@example.com"
			fill_in "Password", with: "password"
			fill_in "Password confirmation", with: "password"
			click_button "Sign up"
		end
		scenario "should allow a user to sign up" do
			expect(page).to have_content("Now link your account")
		end
		feature "Link to app page" do
			before do
			end
			scenario "should have the images" do
				images = ["app_1.png","app_2.png","app_3.png","app_4.png","app_5.png"]
				images.each do |image|
					expect(page).to have_xpath("//img[@src=\"/assets/#{image}\"]")
				end
			end
		end
	end
end

feature "Main page" do
	before do
		mock = MovesMock.new("token")
		allow(Moves::Client).to receive(:new).and_return(mock)
		@months = [132,858, 1652, 117]
		@user = FactoryGirl.create(:user, moves_token: "hithere", 
															 steps_month: @months.inject(:+), steps_today: @months[0])
		allow(@user).to receive(:valid_token?).and_return(true)
		login_as(@user, scope: :user)
		visit '/'
	end
	scenario "should have the correct content" do
		expect(page).to have_content("Daily Leaderboard")
		expect(page).to have_content("Monthly Leaderboard")
	end
	scenario "should have the day's steps" do
		expect(page).to have_content(@user.steps_today)
		expect(page).to have_content(@user.steps_month)
	end
	scenario "should have the day's steps" do
		within('#daily-leaderboard') do
			expect(page).to have_content(1320)
		end
		expect(page).to have_content(@user.steps_today)
		expect(page).to have_content(@user.steps_month)
	end
	scenario "should have the month's steps" do
		within('#monthly-leaderboard') do
			expect(page).to have_content(@months.inject(:+))
		end
	end
	scenario "should have the month's steps" do
		dates = ["7-12","7-11","7-10","7-09"]
		within('#month-walking-table') do
			dates.each_with_index do |day,i|
				within("#walk-row-#{i+1}") do
					expect(page).to have_content(day)
					expect(page).to have_content(@months.reverse[i])
					expect(page).to have_content(@months.reverse[i] * 10)
				end
			end
		end
	end
end
