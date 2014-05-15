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
      before { sign_in admin }
      
      it { should have_title(admin.name) }
      it { should have_link('Admins'      , href: admins_path) }
      it { should have_link('Profile'     , href: admin_path(admin)) }
      it { should have_link('Sign out'    , href: signout_path) }
      it { should_not have_link('Sign in' , href: signin_path) }
      
      
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end
  
  describe "authorization" do
    
    describe "as wrong user" do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:wrong_admin) { FactoryGirl.create(:admin, email: "wrong@example.com") }
      before { sign_in admin, no_capybara: true }
      
      describe "submitting a GET request to the Admin#edit action" do
        before { get edit_admin_path(wrong_admin) }
        specify { expect(response.body).not_to match('Edit user') }
        specify { expect(response).to redirect_to(root_url) }
      end
      
      describe "submitting a PATCH request to the Admin#update action" do
        before { patch admin_path(wrong_admin) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
    
    describe "as non-super_admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
      let(:non_super_admin) { FactoryGirl.create(:admin) }
      
      before { sign_in non_super_admin, no_capybara: true }
      
      describe "submitting a DELETE request to the Admins#destroy action" do
        before { delete admin_path(admin) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
    
   
  end
  
  describe "for non-signed-in admin" do
    let(:admin) { FactoryGirl.create(:admin) }
    
    describe "when attempting to visit a protected pade" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        visit edit_admin_path(admin)
        fill_in "Email"     , with: admin.email
        fill_in "Password"  , with: admin.password
        click_button "Sign in"
      end
      
      describe "after signing in" do
        it "should render the desired protected page" do
          expect(page).to have_title('Editar usuario')
        end
      end
    end
    
    describe "in the Admin controller" do
      
      describe "visiting the admin index" do
        before { visit admins_path }
        it { should have_title('Sign in') }
      end
      
      describe 'visiting the edit page' do
        before { visit edit_admin_path(admin) }
        it { should have_title('Sign in') }
      end
      
      describe "submiting to the update action" do
        before { patch admin_path(admin) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end
    
  end
  
end