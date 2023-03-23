ActiveAdmin.register Student, as: "Student" do
  #  menu parent: "School"
    permit_params :name,:age ,:roll_no,:school_id
  
    scope :actives

    index do
      selectable_column
      id_column
      column :name
      column :age
      column :roll_no
      column :school_id
      column :created_at
      column :updated_at
      actions
    end
  
    filter :name
    filter :age
    filter :roll_no
   

    show do 
        attributes_table do  
          row :name
          row :age
          row :roll_no
          row :school_id
          row :created_at
          row :updated_at
        end   
      end 
    
  
    form do |f|
      f.inputs do
      f.input :name
      f.input :age
      f.input :roll_no
      f.input :school_id, as: :select, collection: School.ids
    end
      f.actions
    end
  
  end