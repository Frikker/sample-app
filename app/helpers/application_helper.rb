module ApplicationHelper

  def full_title(page_name = '')
    base_name = 'Ruby on Rails Tutorial Application'
    page_name.empty? ? base_name : "#{page_name} | #{base_name}"
  end
end
