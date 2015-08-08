class PairCreator
  attr_reader :students, :pair_recordable

  def initialize students, pair_recordable
    @students   = students
    @pair_recordable = pair_recordable
  end

  def self.call students, pair_recordable
    todays_pairs.empty? ? new(students, pair_recordable).pairs : todays_pairs
  end

  def pairs
    students.each_slice(2).each_with_object [] do |pair, array_of_pairs|
      array_of_pairs << pair_recordable.record(pair)
    end
  end

  def self.todays_pairs
    Pair.created_today
  end
end
