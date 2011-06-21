#Given /^I have a set of (.+)$/ do |question|
#  question.split(', ').each do |question|
#	Question.create!(:question => question)
#  end
#end
Given /^the following question$/ do |table|
  table.hashes.each do |hash|
    Factory(:question, hash)
  end
end

Given /^I have a set of question$/ do
  output = tableish('table tr', 'td,th')
  data = output[1]
  data[0].should == 'Question'
end



