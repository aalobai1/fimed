class Treatment < ApplicationRecord
  belongs_to :patient
  validates_presence_of :display_name, :coding, :code
  validates_inclusion_of :covered_by_insurance, in: [true, false]

  def covered_by_insurance
    supported_codes.keys.each do | insurance_provider |
      if supported_codes[insurance_provider]["supported_codes"].include? code
        return true
      end
      return false
    end
  end

  def supported_codes
    @supported_codes ||= YAML.safe_load(File.read('config/insurance_icd_codes.yaml'))
  end
end
