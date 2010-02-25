class User < ActiveRecord::Base
  has_many :presentations,         :class_name => "Presentation", :foreign_key => "presenter_id"
  has_many :created_presentations, :class_name => "Presentation", :foreign_key => 'owner_id'
  has_many :likes
  has_many :liked_presentation_ideas, :through => :likes, :source => :presentation


  def likes?(presentation)
    liked_presentation_ideas.map(&:id).include? presentation.id
  end

  include Clearance::User
end

