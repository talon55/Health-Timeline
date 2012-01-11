require 'spec_helper'

describe "episodes/index.html.haml" do
  before(:each) do
    assign(:episodes, [
      stub_model(Episode,
        :title => "Title",
        :family_name => "Family Name",
        :given_name => "Given Name"
      ),
      stub_model(Episode,
        :title => "Title",
        :family_name => "Family Name",
        :given_name => "Given Name"
      )
    ])
  end

  it "renders a list of episodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Given Name".to_s, :count => 2
  end
end
