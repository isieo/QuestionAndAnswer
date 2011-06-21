Factory.define :question do |f|
  f.sequence(:name) { |n| "Pencil#{n}" }
  f.description "Pencil that draws nicely"
end
