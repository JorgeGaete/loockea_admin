require 'spec_helper'

describe "AdminPages" do
  
  subject { page }
  
  describe "profile page" do
    let(:admin) { FactoryGirl.create(:admin) }
    before { visit admin_path(admin) }
    
    it { should have_content(admin.name) }
    it { should have_title(admin.name) }
    
  end
  
  describe "singup pages" do
    before { visit signup_path }
    
    it { should have_content{'Sign up'} }
    it { should have_title('Sign up') }
    
    let(:submit) { "Create my account" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Admin, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",                   with: "Jorge Gaete"
        fill_in "Email",                  with: "jorgito@kakash.ka"
        fill_in "Password",               with: "foobar"
        fill_in "Confirmation",  with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(Admin, :count).by(1)
      end
      
      describe "after saving the user" do
        before {click_button submit}
        let(:admin) { Admin.find_by(email: "jorgito@kakash.ka") }
        
        it { should have_link('Sign out') }
        it { should have_title(admin.name) }
        it { should have_selector('div.alert.alert-success', text: 'Bienvenido') }
      end

    end
  end
end