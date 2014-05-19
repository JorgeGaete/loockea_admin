require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
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
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profiles_path, "post" do
      assert_select "input#profile_sports[name=?]", "profile[sports]"
      assert_select "input#profile_fashion_beauty[name=?]", "profile[fashion_beauty]"
      assert_select "input#profile_news_current[name=?]", "profile[news_current]"
      assert_select "input#profile_art_design[name=?]", "profile[art_design]"
      assert_select "input#profile_tecnology[name=?]", "profile[tecnology]"
      assert_select "input#profile_outdoor_running[name=?]", "profile[outdoor_running]"
      assert_select "input#profile_pictures_images[name=?]", "profile[pictures_images]"
      assert_select "input#profile_gossips[name=?]", "profile[gossips]"
      assert_select "input#profile_fun_memes[name=?]", "profile[fun_memes]"
      assert_select "input#profile_finance_economics[name=?]", "profile[finance_economics]"
      assert_select "input#profile_business_enterpreneurship[name=?]", "profile[business_enterpreneurship]"
      assert_select "input#profile_music[name=?]", "profile[music]"
      assert_select "input#profile_movies_series_theater[name=?]", "profile[movies_series_theater]"
      assert_select "input#profile_travel[name=?]", "profile[travel]"
      assert_select "input#profile_to_do_culture[name=?]", "profile[to_do_culture]"
    end
  end
end
