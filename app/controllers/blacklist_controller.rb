class BlacklistController < ApplicationController
  def index
    @potential_partners = Student.all - current_student.enemies - [current_student]
  end

  def create
    Blacklist.create(
      student_id: params[:student_id],
      enemy_id:   params[:enemy]
    )

    redirect_to student_blacklist_index_path
  end
end
