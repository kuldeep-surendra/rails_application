class RemoveColumnInviteesFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :invitees, :string
  end
end
