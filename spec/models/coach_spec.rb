require 'rails_helper'

RSpec.describe Coach, type: :model do
  context "relationships" do
    it { should respond_to(:courses) }
  end

  it "is valid with valid attributes" do
    expect(Coach.new(name: "Coach")).to be_valid
  end

  it "is not valid without a name" do
    expect(Coach.new).to_not be_valid
  end
end
