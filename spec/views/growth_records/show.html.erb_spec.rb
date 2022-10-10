require 'rails_helper'

RSpec.describe "growth_records/show", type: :view do
  before(:each) do
    @growth_record = assign(:growth_record, GrowthRecord.create!(
      height: 2,
      weight: 3,
      kid: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
