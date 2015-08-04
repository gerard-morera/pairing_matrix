class AddPartnerIdToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :partner_id, :integer
  end
end
