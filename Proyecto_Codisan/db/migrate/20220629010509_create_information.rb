class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.string :name
      t.string :direction
      t.string :city
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
