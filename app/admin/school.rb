ActiveAdmin.register School, as: "School" do
    permit_params :school_name,:school_address,:school_id
  
    # scope :actives

    index do
      selectable_column
      id_column
      column :school_id
      column :school_address
      column :school_name
      column :created_at
      column :updated_at
      actions
    end
  
    # filter :school_name
    # filter :school_add
    # filter :school_id


    show do |data|
        attributes_table do  
          row :school_id
          row :school_name
          row :school_address
          row :created_at
          row :updated_at
          panel 'Student' do
            table_for data.students do
                column :id
                column :name
                column :age
                column :roll_no
            end
         end
        end   
      end 
    
  
    form do |f|
      f.inputs do
      f.input :school_name
      f.input :school_id
      f.input :school_address
    end
      f.actions
    end
  
  end