require 'rails_helper'

RSpec.describe "growth_records/edit", type: :view do
  before(:each) do
    @growth_record = assign(:growth_record, GrowthRecord.create!(
      height: 1,
      weight: 1,
      kid: nil
    ))
  end

  it "renders the edit growth_record form" do
    render

    assert_select "form[action=?][method=?]", growth_record_path(@growth_record), "post" do

      assert_select "input[name=?]", "growth_record[height]"

      assert_select "input[name=?]", "growth_record[weight]"

      assert_select "input[name=?]", "growth_record[kid_id]"
    end
  end
end
