class Presentation < ActiveRecord::Base

  validates_presence_of :title, :owner_id

  belongs_to :presenter, :class_name => "User"
  belongs_to :owner, :class_name => "User"
  has_many   :likes
  has_many   :users_who_like_this, :through => :likes, :source => :user


  named_scope :archived, :conditions => { :state => 'archived' }, :order => 'date DESC'
  named_scope :ideas,    :conditions => {:state => 'idea'  },     :order => 'created_at DESC'
  named_scope :upcoming, :conditions => {:state => 'upcoming' },  :order => 'date ASC'

  named_scope :sorted_by_likes,
              :joins => 'left outer join likes on likes.presentation_id = presentations.id',
              :group => "presentations",
              :order => 'COUNT(likes.id) DESC'

  def num_likes
    likes.count
  end

end

