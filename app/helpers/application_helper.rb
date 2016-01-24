module ApplicationHelper
  def page_title(title)
    if title.empty?
      OgiharaRyo::Application.config.title
    else
      "#{title} | #{OgiharaRyo::Application.config.title}"
    end
  end
end
