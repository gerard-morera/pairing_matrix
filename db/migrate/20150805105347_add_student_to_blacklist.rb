class AddStudentToBlacklist < ActiveRecord::Migration
  def change
    add_reference :blacklists, :student, index: true, foreign_key: true
  end
end
