class PairCreator
  attr_reader :students

  def initialize
    @students = default_scope
  end

  def pairs
    students.each_slice(2).each_with_object [] do |pair, array_of_pairs|
      array_of_pairs << pair
      record pair
    end
  end

private

  def record pair
    Pair.create student_id: pair[0], partner_id: pair[1]
    Pair.create student_id: pair[1], partner_id: pair[0]
  end

  def default_scope
    Student.all
  end
end

#
