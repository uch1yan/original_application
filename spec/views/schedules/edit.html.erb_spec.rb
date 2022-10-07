require 'rails_helper'

RSpec.describe "schedules/edit", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      title: "MyString",
      content: "MyText",
      kid: nil
    ))
  end

  it "renders the edit schedule form" do
    render

    assert_select "form[action=?][method=?]", schedule_path(@schedule), "post" do

      assert_select "input[name=?]", "schedule[title]"

      assert_select "textarea[name=?]", "schedule[content]"

      assert_select "input[name=?]", "schedule[kid_id]"
    end
  end
end
