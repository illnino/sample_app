require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector 'title', text: '| Home'}

  end

  describe "Help page" do
  	it "should have the content 'Help'" do
	  	visit root_path
  		page.should have_content('Help')
  	end
  end	

  describe "About page" do
  	it "should have the content 'about Us'" do
  		visit about_path
  		page.should have_content('About Us')
  	end
  end

  describe "Contact page" do
    it "should have the h1'Contact" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the title 'Contact' " do
      visit contact_path
      page.should have_selector('title', text: full_title('Contact'))
    end
  end

  describe "check links" do
    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About Us')
      
      click_link "Help"
      page.should have_selector 'title', text: full_title('Help')

      click_link "Home"
      click_link "Sign up now!"
      page.should have_selector 'title', text: full_title('Sign up')

    end    
  end

end
