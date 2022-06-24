class CreateObservers < ActiveRecord::Migration[7.0]
  def change
    create_table :observers do |t|
      t.belongs_to :student, null: false,  foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
