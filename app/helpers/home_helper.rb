module HomeHelper

  def render_like_link(idea)

  return  link_to "Like This", "#",
          :class => "#{ @liked_ideas.include?(idea)? 'already-liked': 'like' }",
          :id => "presentation_#{idea.id}" if current_user

  return "<span class='like-icon'>Like This</span>"


  end

end

