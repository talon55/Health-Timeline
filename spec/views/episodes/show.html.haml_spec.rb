require 'spec_helper'

describe "episodes/show.html.haml" do
  before(:each) do
    @episode = assign(:episode, stub_model(Episode,
      :title => "Title",
      :family_name => "Family Name",
      :given_name => "Given Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Given Name/)
  end
end
