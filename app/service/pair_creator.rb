class PairCreator
  attr_reader :students

  def initialize students
    @students = students
  end

  def self.call students
    todays_pairs.empty? ? new(students).pairs : todays_pairs
  end

  def pairs
    students.each_slice(2).each_with_object [] do |pair, array_of_pairs|
      array_of_pairs << record(pair)
    end
  end

  private

  def record pair
    if pair.size == 2
      Pair.create student_id: pair.first.id, partner_id: pair.last.id
      Pair.create partner_id: pair.first.id, student_id: pair.last.id
    end
  end

  def self.todays_pairs
    Pair.created_today
  end
end
