class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :students

  def students
    @students ||= Student.all
  end
end
