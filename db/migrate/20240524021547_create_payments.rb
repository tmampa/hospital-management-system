class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :payment_method
      t.datetime :date
      t.references :treatment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
