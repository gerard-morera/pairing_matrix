class Pair < ActiveRecord::Base
  belongs_to :student
  belongs_to :partner, class_name: 'Student'
end
