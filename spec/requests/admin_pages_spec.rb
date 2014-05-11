require 'spec_helper'

describe "AdminPages" do
  
  subject { page }
  
  describe "singup pages" do
    before { visit signup_path }
    
    it { should have_content{'Sign up'} }
    it { should have_title('Sign up') }

  end
end
