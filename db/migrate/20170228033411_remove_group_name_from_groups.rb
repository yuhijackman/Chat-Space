class RemoveGroupNameFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :group_name, :string
  end
end
