class CreateFaultObservers < ActiveRecord::Migration[7.0]
  def change
    create_table :fault_observers do |t|
      t.text :description

      t.references :observer, null: false, foreign_key: true
      t.references :fault, null: false, foreign_key: true
      t.timestamps
    end
  end
end
