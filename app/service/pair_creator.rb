class PairCreator
  attr_reader :students

  def initialize
    @students = default_scope
  end

  def pairs
    students.each_slice(2).each_with_object [] do |pair, array_of_pairs|
      binding.pry
      array_of_pairs << pair
    end
  end

private
  
  def default_scope
    Student.all
  end
end

# 