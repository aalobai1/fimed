class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.string :display_name
      t.string :coding
      t.string :code
      t.boolean :covered_by_insurance
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
