require 'spec_helper'

describe "profiles/index" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
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
      ),
      stub_model(Profile,
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
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
