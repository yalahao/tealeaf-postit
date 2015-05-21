class VotesController << ActionController

  before_create :set_current_user

  def set_current_user
    self.user = current_user
  end 
end 