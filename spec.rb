
class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    @middle_name ? "#{@first_name} #{@middle_name} #{@last_name}" : "#{@first_name} #{@last_name}"
  end

  def full_name_with_middle_initial
    "#{@first_name} #{@middle_name[0]} #{@last_name}"
  end

  def initials
    "#{@first_name[0]} #{@middle_name[0]} #{@last_name[0]}"
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "Korgoth", middle_name: "The", last_name: "Barbarian")
      expect(person.full_name).to eq("Korgoth The Barbarian")
    end
    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Korgoth", last_name: "Barbarian")
      expect(person.full_name).to eq("Korgoth Barbarian")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle intial, and last name with spaces" do
      person = Person.new(first_name: "Korgoth", middle_name: "The", last_name: "Barbarian")
      expect(person.full_name_with_middle_initial).to eq("Korgoth T Barbarian")
    end
  end

  describe "#initials" do
    it "concatenates first initial, middle initial, and last initial with spaces" do
      person = Person.new(first_name: "Korgoth", middle_name: "The", last_name: "Barbarian")
      expect(person.initials).to eq("K T B")
    end
  end
end
