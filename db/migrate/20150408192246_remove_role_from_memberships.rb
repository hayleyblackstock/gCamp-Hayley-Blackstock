class RemoveRoleFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :role, :boolean
  end
end
