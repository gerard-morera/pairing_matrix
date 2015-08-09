module PairRecordable
  def self.record pair
    if pair.size == 2
      Pair.create student_id: pair.first.id, partner_id: pair.last.id
      Pair.create partner_id: pair.first.id, student_id: pair.last.id
    end
  end
end
