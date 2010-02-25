module HomeHelper

  def render_like_link(idea)
  link_to "Like This", "#",
          :class => "#{ @liked_ideas.include?(idea)? 'already-liked': 'like' }",
          :id => "presentation_#{idea.id}"
  end

end

