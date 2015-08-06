class BlacklistController < ApplicationController
  before_action :authenticate_student!

  def index
    @potential_partners = @students - current_student.enemies - [current_student]
  end

  def create
    Blacklist.create(
      student_id: params[:student_id],
      enemy_id:   params[:enemy] 
    )

    redirect_to student_blacklist_index_path
  end
end
