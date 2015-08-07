class BlackListCreator
  def self.call params
    new.create params
  end

  def create params
    Blacklist.create(
      student_id: params[:student_id],
      enemy_id:   params[:enemy]
    )
  end
end
