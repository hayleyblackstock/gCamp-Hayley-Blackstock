class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :project_id
      t.integer :user_id
      t.boolean :role
    end
  end
end
