ActiveAdmin.register Doctor do

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	# Uncomment all parameters which should be permitted for assignment
	#
	permit_params :first_name, :last_name, :specialization, :phone, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
	#
	# or
	#
	# permit_params do
	#   permitted = [:first_name, :last_name, :specialization, :phone, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
	#   permitted << :other if params[:action] == 'create' && current_user.admin?
	#   permitted
	# end

	index do
		selectable_column
		id_column
		column :first_name
		column :last_name
		column :specialization
		column :phone
		column :email
		column :role
		actions
	end

	filter :first_name
	filter :last_name
	filter :phone
	filter :email
	filter :specialization

	form do |f|
		f.inputs do
			f.input :first_name
			f.input :last_name
			f.input :specialization
			f.input :phone
			f.input :email
			f.input :password
			f.input :password_confirmation

			actions
		end
	end

end
