class AddRoleToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :role, :integer
  end
end
