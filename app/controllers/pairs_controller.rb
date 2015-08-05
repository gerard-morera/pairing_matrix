class PairsController < ApplicationController
  def index
    @pairs = PairCreator.new.pairs
    @students = Student.all
  end
end
