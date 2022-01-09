require 'rails_helper'

RSpec.describe Activity, type: :model do
  context "relationships" do
    it { should respond_to(:course) }
  end

  it "is valid with valid attributes" do
    expect(Activity.new(name: "Activity", course: Course.new(name: "Math", coach: Coach.new(name: "Coach")))).to be_valid
  end

  it "is not valid without a name" do
    expect(Activity.new).to_not be_valid
  end

  it "is not valid without a course" do
    expect(Activity.new(name: "Activity")).to_not be_valid
  end
end
