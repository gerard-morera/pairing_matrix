class Pair < ActiveRecord::Base
  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }

  belongs_to :student
  belongs_to :partner, class_name: 'Student'
end
