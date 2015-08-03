class StudentsController < ApplicationController
  def index
    @pairs = Student.all
  end
end
