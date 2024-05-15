class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :gender
      t.string :address
      t.string :role, default: "patient"

      t.timestamps
    end
  end
end
