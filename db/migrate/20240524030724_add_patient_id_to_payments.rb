class AddPatientIdToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :patient_id, :integer
  end
end
