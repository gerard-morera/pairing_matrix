class PartnersController < ApplicationController
  def index
    @unpaireds = Student.all - current_student.partners - [current_student]
  end
end
