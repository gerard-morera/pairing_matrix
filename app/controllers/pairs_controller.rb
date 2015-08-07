class PairsController < ApplicationController
  def index
    @pairs = PairCreator.call(Student.all)
  end
end
