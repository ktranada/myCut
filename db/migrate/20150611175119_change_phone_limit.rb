class ChangePhoneLimit < ActiveRecord::Migration
  def change
    change_column :shops, :phone, :bigint
  end
end
