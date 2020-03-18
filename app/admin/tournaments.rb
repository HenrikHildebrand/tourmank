ActiveAdmin.register Tournament do

  show do
    tabs do
      tab "Teams" do
        panel "Teams" do
          table_for tournament.teams do
            column :user
            column('Name') {|t| "#{t.user.first_name} #{t.user.last_name}" }
            column("Team name") {|t| t.name}
          end
        end
      end

      tab "Games" do
        :nothing
      end
    end
    active_admin_comments
  end

  sidebar "Tournament details", only: :show do
    attributes_table_for tournament do
      row :title
      row :description
      row :date
      row :created_at
      row :updated_at
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :date
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
