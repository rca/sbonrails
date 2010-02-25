Factory.define :presentation do |pres|
  pres.title                 { "Some talk" }
  pres.description           { "some description" }
  pres.owner                 { Factory(:email_confirmed_user) }
end

Factory.define :presentation_idea, :parent => :presentation do |pres|
  pres.state { "idea" }
end

