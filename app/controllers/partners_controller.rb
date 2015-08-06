class PartnersController < ApplicationController
  def index
    @student   = Student.find(params[:student_id])
    @unpaireds = @students - @student.partners - [@student]
  end
end
