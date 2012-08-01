class CreateViews < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :zipcode
      t.string :keywords
      

      t.timestamps
    end
  end
end
