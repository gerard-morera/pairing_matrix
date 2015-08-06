class BlacklistController < ApplicationController
  def index
    @students        = Student.all
    @current_student = Student.find(params[:student_id])
    # @blacklists      = Blacklist.
  end

  def new
  end

  def create
  end
end
