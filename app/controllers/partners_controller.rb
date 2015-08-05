class PartnersController < ApplicationController
  def index
    @students = Student.all
    @student = Student.find(params[:student_id])
  end
end
