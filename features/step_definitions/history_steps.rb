Given /^the following histories:$/ do |histories|
  History.create!(histories.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) history$/ do |pos|
  visit histories_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following histories:$/ do |expected_histories_table|
  expected_histories_table.diff!(tableish('table tr', 'td,th'))
end
