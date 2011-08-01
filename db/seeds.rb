# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)




[
  {:title=>"Thinks logical",:description="can you think logical?", :group => Group.find_by_name('Red')},
  {:title=>"Thinks sad",:description="can yasdasou think logical?"},

].each do |q|
  Question.find_or_create_by_title(q)
end
