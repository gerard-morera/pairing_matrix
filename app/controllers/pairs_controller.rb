class PairsController < ApplicationController
  def index
    @students = Student.all
    @pairs    = PairCreator.call(@students)
  end
end
