require 'spec_helper'

describe "CampanaPages" do
  
  describe "index" do
    before do
      #sign_in FactoryGirl.create(:admin)
      #FactoryGirl.create(:admin, name: "Bob", email: "bob@example.com")
      #FactoryGirl.create(:admin, name: "Ben", email: "ben@example.com")
      #visit admins_path
      let(:campana) { FactoryGirl.create(:campana) }
      let!(:c1) { FactoryGirl.create(:contenidos, @campana, name: "Foo") }
      let!(:c2) { FactoryGirl.create(:contenidos, @campana, name: "Bar") }
      
      before { visit campanas_path }
      
      it { should have_content(campana.name) }
      it { should have_title(campana.name) }
      
      describe "contenidos" do
        it { should have_content(c1.name) }  
        it { should have_content(c2.name) }
        it { should have_content(campana.contenidos.count) }
      end
      
    end
  end
end
    
#    describe "pagination" do
#      
#      before(:all)  { 30.times { FactoryGirl.create(:admin) } }
#      after(:all)   { Admin.delete_all }
#      
#      it { should have_selector('div.pagination') }
#      
#      it "should list each admin" do
#        Admin.paginate(page: 1).each do |admin|
#          expect(page).to have_selector('li', text: admin.name)
#        end
#      end
#    end
    
#    describe "delete links" do
      
#      it { should_not have_link('delete') }
      
#      describe "as an super_admin" do
#        let(:super_admin) { FactoryGirl.create(:super_admin) }
#        before do
#          sign_in super_admin
#          visit admins_path
#        end
        
#        it {should have_link('eliminar', href: admin_path(Admin.first))}
#        it "should be able to delete another admin" do
#          expect do
#            click_link('eliminar', match: :first)
#          end.to change(Admin, :count).by(-1)
#        end
#        it { should_not have_link('eliminar', href: admin_path(super_admin)) }
#      end  
#    end

#end
#end