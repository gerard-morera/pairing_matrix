class PairRecorder
  def record pair
      Pair.create student_id: pair.first.id, partner_id: pair.last.id
      Pair.create partner_id: pair.first.id, student_id: pair.last.id
  end
end
