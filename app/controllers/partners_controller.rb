class PartnersController < ApplicationController
  def index
    @unpaireds = @students - current_student.partners - [current_student]
  end
end
