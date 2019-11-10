class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :given_name
      t.string :family_name
      t.string :race
      t.string :gender

      t.timestamps
    end
  end
end
