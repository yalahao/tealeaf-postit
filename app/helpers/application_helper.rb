module ApplicationHelper

  def add_http(url)
    url.start_with?("http://") ? url : ("http://" + url)
  end

end
