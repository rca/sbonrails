class Presentation < ActiveRecord::Base
  belongs_to :presenter, :class_name => "User"
  belongs_to :owner, :class_name => "User"
  has_many   :likes
  has_many   :users_who_like_this, :through => :likes, :source => :user

  validates_presence_of :title, :owner_id

  named_scope :archived, :conditions => { :state => 'archived' }, :order => 'date DESC'
  named_scope :ideas,    :conditions => {:state => 'idea'  },     :order => 'created_at DESC'
  named_scope :upcoming, :conditions => {:state => 'upcoming' },  :order => 'date ASC'

  def num_likes
    likes.count
  end

  def self.popular(limit = {})
    ideas.all(limit).sort { |a,b| b.num_likes <=> a.num_likes }
  end

end

