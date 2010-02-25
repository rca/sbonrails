require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
  should_belong_to :presenter
  should_belong_to :owner
  should_validate_presence_of :title

  context "users who like some presentations" do
      setup do
        @user1 = Factory(:email_confirmed_user, :email => 'email1@yahoo.com')
        @user2 = Factory(:email_confirmed_user, :email => 'email2@yahoo.com')
        @user3 = Factory(:email_confirmed_user, :email => 'email3@yahoo.com')

        @presentation_idea1 = Factory(:presentation_idea)
        @presentation_idea2 = Factory(:presentation_idea)
        @presentation_idea3 = Factory(:presentation_idea)

        Like.create(:user => @user1, :presentation => @presentation_idea1)
        Like.create(:user => @user2, :presentation => @presentation_idea1)
        Like.create(:user => @user3, :presentation => @presentation_idea1)

        Like.create(:user => @user2, :presentation => @presentation_idea2)

      end

      should "have method for number of likes" do
       assert_equal @presentation_idea1.num_likes, 3
       assert_equal @presentation_idea2.num_likes, 1
       assert_equal @presentation_idea3.num_likes, 0
      end

      should "have method for popular ideas (sorted by likes)" do
        assert_equal Presentation.popular,[@presentation_idea1,@presentation_idea2,@presentation_idea3]
      end

      should "have way to limit resutls for popular ideas" do
        assert_equal Presentation.popular(:limit => 1), [@presentation_idea1]
      end

    end


end

