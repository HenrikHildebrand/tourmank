ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    actions
  end

  form title: "Edit user" do |f|

    f.semantic_errors *f.object.errors.keys
    f.actions
    tabs do
      tab 'User' do
        f.inputs "Details" do
          f.input :first_name
          f.input :last_name
          f.input :email
        end
      end
      tab 'Teams' do
        f.has_many :teams, allow_destroy: true do |team|
          team.inputs "Teams" do
            team.input :name
            team.input :tournament, collection: Tournament.all
          end
        end
      end
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email,
                :encrypted_password,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                :first_name,
                :last_name,
                teams_attributes: [:id, :name, :user_id, :tournament_id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
