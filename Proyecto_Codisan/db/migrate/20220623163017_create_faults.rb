class CreateFaults < ActiveRecord::Migration[7.0]
  def change
    create_table :faults do |t|
      t.string :category
      t.text :description
      t.string :sanction
      t.timestamps
    end
  end
end
