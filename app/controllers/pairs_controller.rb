class PairsController < ApplicationController
  def index
    @pairs = PairCreator.new.pairs
  end
end
