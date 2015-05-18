module ApplicationHelper

  def add_http(url)
    url.start_with?("http://") ? url : ("http://" + url)
  end

  def formatted_date(datetime)
    datetime.strftime("on %B %-d, %Y")
  end

  def vote_status(user, obj)
    current_user_vote = obj.votes.find_by(user_id: user.id)
    if current_user_vote
      current_user_vote.vote
    else
      nil
    end
  end

end
