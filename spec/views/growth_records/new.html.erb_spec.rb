require 'rails_helper'

RSpec.describe "growth_records/new", type: :view do
  before(:each) do
    assign(:growth_record, GrowthRecord.new(
      height: 1,
      weight: 1,
      kid: nil
    ))
  end

  it "renders new growth_record form" do
    render

    assert_select "form[action=?][method=?]", growth_records_path, "post" do

      assert_select "input[name=?]", "growth_record[height]"

      assert_select "input[name=?]", "growth_record[weight]"

      assert_select "input[name=?]", "growth_record[kid_id]"
    end
  end
end
