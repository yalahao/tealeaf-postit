class VotesController < ApplicationController

  before_update :set_current_user

  def set_current_user
    binding.pry
    self.creator = current_user
  end 
end 