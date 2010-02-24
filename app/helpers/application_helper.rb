# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_flash
    html = "<div id='flash'>"
    flash.each do |key, value|
        html += "<div id='flash_#{key}'> #{value} </div>"
      end
    html += "</div>"
  end

end

