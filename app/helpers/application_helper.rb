module ApplicationHelper

  def add_http(url)
    url.start_with?("http://") ? url : ("http://" + url)
  end

  def formatted_date(datetime)
    datetime.strftime("on %B %-d, %Y")
  end

end
