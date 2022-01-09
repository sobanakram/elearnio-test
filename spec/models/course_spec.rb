require 'rails_helper'

RSpec.describe Course, type: :model do
  context "relationships" do
    it { should respond_to(:coach) }
    it { should respond_to(:activities) }
  end

  it "is valid with valid attributes" do
    expect(Course.new(name: "Coach", coach: Coach.new(name: "Coach"))).to be_valid
  end

  it "is not valid without a name" do
    expect(Course.new).to_not be_valid
  end

  it "is not valid without a coach" do
    expect(Course.new(name: "Math")).to_not be_valid
  end
end
