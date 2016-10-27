
class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces"
    it "does not add extra spaces if middle name is missing"
  end

  describe "#full_name_with_middle_initial"

  describe "#initials"
end
