class Blacklist < ActiveRecord::Base
  belongs_to :student
  belongs_to :enemy, class_name: 'Student'
end
