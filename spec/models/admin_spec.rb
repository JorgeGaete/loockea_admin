require 'spec_helper'

describe Admin do
  
  before{ @admin = Admin.new(name: "Ksenia", email: "ksenia@bonita.cl", 
    password: "foobar", password_confirmation: "foobar") }
  
  subject { @admin }
  
  it{ should respond_to(:name) }
  it{ should respond_to(:email) }
  it{ should respond_to(:password_digest) }
  it{ should respond_to(:password) }
  it{ should respond_to(:password_confirmation) }
  it{ should respond_to(:authenticate) }
  
  it{ should be_valid }
  
  describe "when name is not present" do
    before { @admin.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @admin.name = "a"*51 }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @admin.email = " " }
    it { should_not be_valid }
  end
  
  describe "when email is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @admin.email = valid_address
        expect(@admin).to be_valid
        end
      end
  end
  
  describe "when email is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @admin.email = invalid_address
        expect(@admin).not_to be_valid
        end
      end
  end
  
  describe "when email address is already taken" do
      before do
        admin_with_same_email = @admin.dup
        admin_with_same_email.email = @admin.email.upcase
        admin_with_same_email.save
      end

      it { should_not be_valid }
    end
    
    describe "when password is not present" do
      before do
        @admin = Admin.new(name: "Ksenia", email: "ksenia@bonita.cl", 
        password: " ", password_confirmation: " ")
      end
      it { should_not be_valid }
    end
    
    describe "when password doesn't match confirmation" do
      before { @admin.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
    
    describe "with a password that's too short" do
      before { @admin.password = @admin.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
    
    describe "return value of authenticate method" do
      
      before { @admin.save }
      let(:found_user) { Admin.find_by(email: @admin.email) }
      
      describe "with valid password" do
        it { should eq found_user.authenticate(@admin.password) }
      end
      
      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }
          
        it { should_not eq user_for_invalid_password }
        specify { expect(user_for_invalid_password).to be_false }
      end
    end  
end