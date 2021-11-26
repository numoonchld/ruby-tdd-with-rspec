class Student
  def initialize(first,last)
    @first_name = first
    @last_name = last
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def full_name
    `#{@first_name} #{@last_name}`
  end
end