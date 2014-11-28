Given(/^Given an applicant user registered$/) do
  visit (APPLICANT_REGISTRATION_PAGE)
  # expect(@browser.url).to match Regexp.new(APPLICANT_REGISTRATION_PAGE)

  page.should have_content('Registration')

  find_by_id("user_name")
  find_by_id("user_email")
  find_by_id("user_password")
  find_by_id("user_password_confirmation")

  fill_in('user_name', :with => 'Applicant')
  fill_in('user_email', :with => 'applicant@test.com')
  fill_in('user_password', :with => 'Passw0rd')
  fill_in('user_password_confirmation', :with => 'Passw0rd')

  has_button?('Create').should eq true
  click_button('Create')
end

Given(/^I am logged in as applicant$/) do

  step 'Given an applicant user registered'
  visit (LOGIN_PAGE)

  page.has_title? "Login"

  find_by_id("user_email")
  find_by_id("user_password")

  fill_in('user_email', :with => 'applicant@test.com')
  fill_in('user_password', :with => 'Passw0rd')
  
  has_button?('Login').should eq true
  click_button('Login')
  
end

Given(/^I am at Current Job Offers page$/) do
  visit (JOB_OFFERS_PAGE)
  page.has_title? "Current Job Offers"  
end


When(/^I apply for a Web Programmer job offer$/) do
  click_button('Apply')
end

Then(/^I should see You have applied for: "(.*?)"$/) do |job_offer|
  page.should have_content('You have applied for: ' + job_offer)
end

When(/^I browse to My Applications$/) do
  visit (HOME_PAGE)
  page.should have_content('My Applications')
  click_link('My Applications')
end

Then(/^It should list "(.*?)"$/) do |offer_title|
  page.should have_content(offer_title)
end
