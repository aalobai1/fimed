class Treatment < ApplicationRecord
  belongs_to :patient
  validates_presence_of :display_name, :coding, :code
  validates_inclusion_of :covered_by_insurance, in: [true, false]
end
