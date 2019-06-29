ActiveAdmin.register User do
  permit_params :email, :name, :company_name, :phone, :status, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :company_name
    column :phone
    # column :status
    column(:status) do |stat| 
      stat.status? ? status_tag( "Active") : status_tag( "Inactive" )
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :company_name
      f.input :phone
      f.input :status
    end
    f.actions
  end

end