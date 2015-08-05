class Student < ActiveRecord::Base
  has_many :pairs
  has_many :partners, through: :pairs
  has_many :paired_students, through: :pairs, source: :students
  has_many :blacklists
  has_many :enemies, through: :blacklists, class_name: 'Student'
end 