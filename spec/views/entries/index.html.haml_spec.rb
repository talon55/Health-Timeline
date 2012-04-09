require 'spec_helper'

describe "entries/index.html.haml" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry),
      stub_model(Entry)
    ])
  end

  it "renders a list of entries" do
    render
  end
end
