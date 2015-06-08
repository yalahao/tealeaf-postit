module Voteable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do 
      has_many_votes
    end
  end

  module ClassMethods
    def has_many_votes
      has_many :votes, as: :voteable
    end
  end

  module InstanceMethods
    def vote_status(user)
      current_user_vote = self.votes.find_by(user_id: user.id)
      if current_user_vote
        current_user_vote.vote
      else
        nil
      end
    end

    def vote_count
      up_vote = self.votes.where(vote: true).size
      down_vote = self.votes.where(vote: false).size
      up_vote - down_vote
    end
  end

end
