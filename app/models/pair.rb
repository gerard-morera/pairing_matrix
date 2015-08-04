class Pair < ActiveRecord::Base

  belongs_to :student
  belongs_to :partner, class_name: 'Student'
  has_many :paired_students, through: :pairs, source: :student
end
