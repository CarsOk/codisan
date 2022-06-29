class AddAvatarToInformation < ActiveRecord::Migration[7.0]
  def change
    add_column :information, :avatar, :string
  end
end
