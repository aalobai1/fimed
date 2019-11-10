class RemoveCoveredByInsuranceFromTreatment < ActiveRecord::Migration[5.2]
  def change
    remove_column :treatments, :covered_by_insurance
  end
end
