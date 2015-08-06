class BlacklistController < ApplicationController
  def index
    @students           = Student.all
    @current_student    = Student.find(params[:student_id])
    @potential_partners = @students - @current_student.enemies
  end

  def new
  end

  def create
    Blacklist.create(
      student_id: params[:student_id],
      enemy_id:   params[:enemy] 
    )
    
    redirect_to student_blacklist_index_path
  end
end
