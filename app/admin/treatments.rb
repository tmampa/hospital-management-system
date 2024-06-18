ActiveAdmin.register Treatment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :prescription, :diagnosis, :appointment_id, :doctor_id, :patient_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:prescription, :diagnosis, :appointment_id, :doctor_id, :patient_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
