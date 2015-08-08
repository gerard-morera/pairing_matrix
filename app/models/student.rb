class Student < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pairs
  has_many :partners, through: :pairs
  has_many :blacklists
  has_many :enemies, through: :blacklists

  def friends
    Student.all - enemies - [self]
  end

  def possible_partners
    Student.all - partners - enemies - [self]
  end
end
