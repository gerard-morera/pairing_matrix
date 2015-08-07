class BlacklistController < ApplicationController
  def index
  end

  def create
    BlackListCreator.call params
    
    redirect_to student_blacklist_index_path
  end
end
