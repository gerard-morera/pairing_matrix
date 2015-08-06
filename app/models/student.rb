class Student < ActiveRecord::Base
  has_many :pairs
  has_many :partners, through: :pairs
  has_many :blacklists
  has_many :ememies, through: :blacklists, class_name: 'Student'
end