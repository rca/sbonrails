module HomeHelper

  def render_like_link(idea)

  return  link_to "Like This", "#",
          :class => "#{ @liked_ideas.include?(idea)? 'already-liked': 'like' }",
          :id => "presentation_#{idea.id}" if current_user

  return "<span class='like-icon'>Like This</span>"


  end



  def google_maps_appfolio_url
    <<-url
        http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=55+Castilian+Dr.+Goleta,+CA+93117&sll=37.0625,-95.677068&sspn=49.176833,114.169922&ie=UTF8&hq=&hnear=55+Castilian+Dr,+Goleta,+Santa+Barbara,+California+93117&z=17&iwloc=A
    url
  end

end

