require 'spec_helper'

describe Campana do
  
  before do
    @campana = Campana.new( content_id:      1,
                            name:            "campana_1",
                            tipo:            1,
                            client:          "campana_1",
                            goal:            100,
                            status:          1
                            )  
  end
  
  subject { @campana }
  
  it { should respond_to{:contenidos} }
  
  describe "contenido associations" do
    
    before { @campana.save }
    let!(:older_contenido) do
      FactoryGirl.create(:contenido, campana: @campana, created_at: 1.day.ago)
    end
    
    let!(:newer_contenido) do
      FactoryGirl.create(:contenido, campana: @campana, created_at: 1.hour.ago)
    end
    
    it "should have the right contenidos in the right order" do
      expect(@campana.contenidos.to_a).to eq [newer_contenido, older_contenido]
    end
    
    it "should destroy associated contenidos" do
      contenidos = @campana.contenidos.to_a
      @campana.destroy
      expect(contenidos).not_to be_empty
      contenidos.each do |contenido|
        expect(Contenido.where(id: contenido.id)).to be_empty
      end
    end
  end
  
  
  
end