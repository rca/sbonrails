require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :presentations,
                   :created_presentations,
                   :likes,
                   :liked_presentation_ideas


   context "users who like some presentations" do
      setup do
        @user1 = Factory(:email_confirmed_user, :email => 'email1@yahoo.com')
        @user2 = Factory(:email_confirmed_user, :email => 'email2@yahoo.com')
        @user3 = Factory(:email_confirmed_user, :email => 'email3@yahoo.com')

        @presentation_idea1 = Factory(:presentation_idea)
        @presentation_idea2 = Factory(:presentation_idea)
        @presentation_idea3 = Factory(:presentation_idea)
      end

      # .likes?(presentation)
      should "return false when user doesnt like presentation" do
        assert !@user1.likes?(@presentation_idea1)
      end

      should "return true when user does like presentation" do
        Like.create(:user => @user1, :presentation => @presentation_idea1 )
        assert @user1.likes?(@presentation_idea1)
      end

    end


end

