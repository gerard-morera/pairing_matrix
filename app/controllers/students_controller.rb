class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    redirect_to root_path
  end
end
