require_relative 'student'

RSpec.describe Student do

  describe "instance methods" do

    subject { Student.new("John", "Doe")}

    it { respond_to(:first_name) }
    it { respond_to(:last_name) }
    it { respond_to(:full_name) }

  end

  describe "total number of students created" do 
    it "should return total students" do 
      Student.new('John','Doe')
      Student.new('Jane','Doe')

      expect(Student.total_count).to eq(2)
    end
  end

end