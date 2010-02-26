Given /^"(.+)" has (.+) likes$/ do |title,num_likes|
  presentation = Presentation.find_by_title(title)

  num_likes.to_i.times do |i|
    Like.create(:user_id => i, :presentation_id => presentation.id)
  end

  presentation.num_likes
  num_likes.to_i
  assert_equal presentation.num_likes, num_likes.to_i

end

