require 'spec_helper'

describe "AdminPages" do
  
  subject { page }
  
  describe "index" do
    before do
      sign_in FactoryGirl.create(:admin)
      FactoryGirl.create(:admin, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:admin, name: "Ben", email: "ben@example.com")
      visit admins_path
    end
    
    it { should have_title('Todos los administradores') }
    it { should have_content('Todos los administradores') }
    
    describe "pagination" do
      
      before(:all)  { 30.times { FactoryGirl.create(:admin) } }
      after(:all)   { Admin.delete_all }
      
      it { should have_selector('div.pagination') }
      
      it "should list each admin" do
        Admin.paginate(page: 1).each do |admin|
          expect(page).to have_selector('li', text: admin.name)
        end
      end

    end
    
    describe "delete links" do
      
      it { should_not have_link('delete') }
      
      describe "as an super_admin" do
        let(:super_admin) { FactoryGirl.create(:super_admin) }
        before do
          sign_in super_admin
          visit admins_path
        end
        
        it {should have_link('eliminar', href: admin_path(Admin.first))}
        it "should be able to delete another admin" do
          expect do
            click_link('eliminar', match: :first)
          end.to change(Admin, :count).by(-1)
        end
        it { should_not have_link('eliminar', href: admin_path(super_admin)) }
      end  
    end
    
  end
  
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
        fill_in "Confirmation",           with: "foobar"
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
  
  describe "edit" do
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit edit_admin_path(admin)
    end
    
    describe "with valid information" do
      let(:new_name) { "New Name" }
      let(:new_email) { "new@example.com" }

      before do
        fill_in "Name",                   with: new_name
        fill_in "Email",                  with: new_email
        fill_in "Password",               with: admin.password
        fill_in "Confirmar Password",       with: admin.password
        click_button "Cambiar"
      end
      
#      it {puts page.body}
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(admin.reload.name).to  eq new_name }
      specify { expect(admin.reload.email).to eq new_email }
      
    end
    
    describe "page" do
      it { should have_content("Edita tu perfil") }
      it { should have_title("Editar usuario") }
      it { should have_link('modificar', href: 'http:/gravatar.com/emails') }
    end
  
    describe "with invalid information" do
      before { click_button "Cambiar" }
    
      it { should have_content('error') }
    end
  end

end