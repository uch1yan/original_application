require 'rails_helper'

RSpec.describe "growth_records/index", type: :view do
  before(:each) do
    assign(:growth_records, [
      GrowthRecord.create!(
        height: 2,
        weight: 3,
        kid: nil
      ),
      GrowthRecord.create!(
        height: 2,
        weight: 3,
        kid: nil
      )
    ])
  end

  it "renders a list of growth_records" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
