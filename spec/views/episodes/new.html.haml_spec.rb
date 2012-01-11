require 'spec_helper'

describe "episodes/new.html.haml" do
  before(:each) do
    assign(:episode, stub_model(Episode,
      :title => "MyString",
      :family_name => "MyString",
      :given_name => "MyString"
    ).as_new_record)
  end

  it "renders new episode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => episodes_path, :method => "post" do
      assert_select "input#episode_title", :name => "episode[title]"
      assert_select "input#episode_family_name", :name => "episode[family_name]"
      assert_select "input#episode_given_name", :name => "episode[given_name]"
    end
  end
end
