class PairCreator
  attr_reader :students

  def initialize
    @students = default_scope
  end

  def pairs
    students.each_slice(2).each_with_object [] do |(student_1, student_2), array_of_pairs|
      array_of_pairs << generate_pair( student_1, student_2 )
    end
  end

private

  def generate_pair student_1, student_2
    Pair.create student_id: student_2.id, partner_id: student_1.id
    Pair.create student_id: student_1.id, partner_id: student_2.id
  end

  def default_scope
    Student.all
  end
end