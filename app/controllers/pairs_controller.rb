class PairsController < ApplicationController
  def index
    @pairs = Student.all
  end
end
