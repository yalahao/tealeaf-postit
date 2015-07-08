module ApplicationHelper

  def add_http(url)
    url.start_with?("http://") ? url : ("http://" + url)
  end

  def formatted_date(datetime)
    if logged_in? && !current_user.time_zone.blank?
      datetime = datetime.in_time_zone(current_user.time_zone)
    end

    datetime.strftime("on %B %-d, %Y %Z")
    
  end



end
