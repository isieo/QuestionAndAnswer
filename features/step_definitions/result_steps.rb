Given /^the following results:$/ do |results|
  Result.create!(results.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) result$/ do |pos|
  visit results_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following results:$/ do |expected_results_table|
  expected_results_table.diff!(tableish('table tr', 'td,th'))
end
