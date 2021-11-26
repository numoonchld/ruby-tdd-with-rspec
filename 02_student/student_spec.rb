require_relative 'student'

RSpec.describe Student do

  before do 
    @student = Student.new('John', 'Doe') 
  end

  it 'should respond to #first_name' do
    expect(@student).to respond_to(:first_name) 
  end
  
  it 'should respond to #last_name' do
    expect(@student).to respond_to(:last_name) 
  end
  
  it 'should respond to #full_name' do 
    expect(@student).to respond_to(:full_name) 
  end
  
end