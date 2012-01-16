# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

unless User.find_by_email('jimmy@brainbytes.org')
  admin = User.new({:email => 'jimmy@brainbytes.org', :encrypted_password => 'superadmin'})
  admin.save
end

QuestionGroup.create([{ :name => 'Blue' }, { :name => 'Yellow' }, { :name => 'Green' },{ :name => 'Red' }])


[
  {:title=>"Thinks Rationally", :description=>"can you think logical?", :question_group_id => QuestionGroup.find_by_name('Blue').id},
  {:title=>"Imaginative",:description=>"can you imagine?", :question_group_id => QuestionGroup.find_by_name('Yellow').id},
  {:title=>"Quiet",:description=>"are you the quiet type?", :question_group_id => QuestionGroup.find_by_name('Green').id},
  {:title=>"Outgoing & Extroverted",:description=>"are you the outgoing type?", :question_group_id => QuestionGroup.find_by_name('Red').id}
].each do |q|
  Question.find_or_create_by_title(q)
end
