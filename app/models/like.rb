class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation
  validates_presence_of :user_id,:presentation_id
  validate :user_cant_like_presentation_twice

  def user_cant_like_presentation_twice
    errors.add_to_base("user already likes this presentation!") if already_liked?
  end

  def already_liked?
    !Like.find(:all, :conditions => { :user_id => user_id,
                                     :presentation_id => presentation_id }).empty?
  end

end

