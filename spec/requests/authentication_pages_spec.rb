require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }
  
  describe "Singin" do
    before { visit signin_path }
    
    it { should have_content('Sign in') }
    
    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }
      
      describe "visiting another page after" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    describe "with valid information" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        fill_in "Email",                    with: admin.email.upcase
        fill_in "Password",                 with: admin.password
        click_button "Sign in"
      end
      
      it { should have_title(admin.name) }
      it { should have_link('Profile',      href: admin_path(admin)) }
      it { should have_link('Sign out',     href: signout_path) }
      it { should_not have_link('Sign in',  href: signin_path) }
      
      
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    
    end
  end
end