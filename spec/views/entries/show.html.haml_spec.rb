require 'spec_helper'

describe "entries/show.html.haml" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry))
  end

  it "renders attributes in <p>" do
    render
  end
end
