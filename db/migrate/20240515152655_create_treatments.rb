class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.text :prescription
      t.text :diagnosis
      t.references :appointment, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
