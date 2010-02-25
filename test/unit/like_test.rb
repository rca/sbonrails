require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  should_validate_presence_of :user_id, :presentation_id


    context "users who like some presentations" do
      setup do
        @user1 = Factory(:email_confirmed_user, :email => 'email1@yahoo.com')
        @user2 = Factory(:email_confirmed_user, :email => 'email2@yahoo.com')
        @user3 = Factory(:email_confirmed_user, :email => 'email3@yahoo.com')

        @presentation_idea1 = Factory(:presentation_idea)
        @presentation_idea2 = Factory(:presentation_idea)
        @presentation_idea3 = Factory(:presentation_idea)
      end

      should "form a join model between presentations and users" do
        Like.create(:user => @user1, :presentation => @presentation_idea1 )
        assert_equal @presentation_idea1, @user1.liked_presentation_ideas.first
        assert_equal @user1, @presentation_idea1.users_who_like_this.first
      end

      should "not allow users to like presentation multiple times" do
        like1 = Like.new(:user => @user1, :presentation => @presentation_idea1 )
        assert like1.valid?
        assert like1.save

        like2 = Like.new(:user => @user1, :presentation => @presentation_idea1 )
        assert !like2.valid?

      end

    end



end

