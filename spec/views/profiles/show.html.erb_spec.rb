require 'spec_helper'

describe "profiles/show" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :sports => "",
      :fashion_beauty => "",
      :news_current => "",
      :art_design => "",
      :tecnology => "",
      :outdoor_running => "",
      :pictures_images => "",
      :gossips => "",
      :fun_memes => "",
      :finance_economics => "",
      :business_enterpreneurship => "",
      :music => "",
      :movies_series_theater => "",
      :travel => "",
      :to_do_culture => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
