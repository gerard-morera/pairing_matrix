class PairCreator

  attr_reader :students

  def initialize
    @students = default_scope
  end

  def pairs
    students.each_slice(2).each_with_object [] do |pairs, array_of_pairs|
      array_of_pairs << pairs
    end
  end

private
  
  def default_scope
    Student.all
  end
end
