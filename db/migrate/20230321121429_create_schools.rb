class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_address
      t.integer :school_id

      t.timestamps
    end
  end
end
