require 'spec_helper'

describe Contenido do
  let(:campana) { FactoryGirl.create(:campana) }
  before do
    @content = campana.contenidos.build(  name: "noticia_1",
                                          tipo: 1,
                                          provider: "proveerdor_1",
                                          category_id: 0,
                                          end_date: DateTime.strptime('12-JUL-14', '%d-%b-%y'),
                                          status: 1
                                          )
  end
  
  subject { @content }
  
  it { should respond_to(:campana_id) } 
  it { should respond_to(:name) }
  it { should respond_to(:tipo) }
  it { should respond_to(:provider) }
  it { should respond_to(:category_id) }
  it { should respond_to(:end_date) }
  it { should respond_to(:status) }
  its (:campana) { should eq campana }  
  
  it { should be_valid }
  
  describe "when no valid due to" do
    
    describe "campana_id not present" do
      before { @content.campana_id = nil }
      it { should_not be_valid }
    end
    
    describe "status not present" do
      before { @content.status = nil }
      it { should_not be_valid } 
    end
    
  end
  
end