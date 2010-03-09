require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
  should_belong_to :presenter, :owner
  should_have_many :likes, :users_who_like_this
  should_validate_presence_of :title, :owner_id

  context "users who like some presentations" do
      setup do
        @user1 = Factory(:email_confirmed_user, :email => 'email1@yahoo.com')
        @user2 = Factory(:email_confirmed_user, :email => 'email2@yahoo.com')
        @user3 = Factory(:email_confirmed_user, :email => 'email3@yahoo.com')
        @user4 = Factory(:email_confirmed_user, :email => 'email4@yahoo.com')
        @user5 = Factory(:email_confirmed_user, :email => 'email5@yahoo.com')
        @user6 = Factory(:email_confirmed_user, :email => 'email6@yahoo.com')


        @presentation_idea1 = Factory(:presentation_idea, :created_at => Time.now - 1.year )
        @presentation_idea2 = Factory(:presentation_idea, :created_at => Time.now - 2.months )
        @presentation_idea3 = Factory(:presentation_idea, :created_at => Time.now - 3.months )
        @presentation_idea4 = Factory(:presentation_idea)
        @presentation_idea5 = Factory(:presentation_idea)

        Like.create(:user => @user1, :presentation => @presentation_idea1)
        Like.create(:user => @user2, :presentation => @presentation_idea1)
        Like.create(:user => @user3, :presentation => @presentation_idea1)

        Like.create(:user => @user2, :presentation => @presentation_idea2)
        Like.create(:user => @user3, :presentation => @presentation_idea2)

        Like.create(:user => @user3, :presentation => @presentation_idea3)

        Like.create(:user => @user1, :presentation => @presentation_idea4)
        Like.create(:user => @user2, :presentation => @presentation_idea4)
        Like.create(:user => @user3, :presentation => @presentation_idea4)
        Like.create(:user => @user4, :presentation => @presentation_idea4)
        Like.create(:user => @user5, :presentation => @presentation_idea4)
        Like.create(:user => @user6, :presentation => @presentation_idea4)


      end

      should "have method for number of likes" do
       assert_equal @presentation_idea1.num_likes, 3
       assert_equal @presentation_idea2.num_likes, 2
       assert_equal @presentation_idea3.num_likes, 1
       assert_equal @presentation_idea4.num_likes, 6
      end



      should "have way to limit resutls for popular ideas" do
        assert_equal Presentation.sorted_by_likes.all(:limit => 1), [@presentation_idea4]
      end


      # Temp method to circumvent - named_scope issues between mysql & psql
      should "have method for popular ideas (sorted by likes_slow)" do
        assert_equal  Presentation.sorted_by_likes_slow,
                    [ @presentation_idea4,
                      @presentation_idea1,
                      @presentation_idea2,
                      @presentation_idea3,
                      @presentation_idea5 ]
      end


      should "have way to limit resutls for popular ideas (slower method)" do
        assert_equal Presentation.sorted_by_likes_slow(:limit => 1), [@presentation_idea4]
      end

    end


end

