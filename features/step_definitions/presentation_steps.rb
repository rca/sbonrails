Given /^presentation ideas (.+)$/ do |presentations|
  presentations.split(',').each do |title|
    Factory(:presentation, :title => title)
  end
end

