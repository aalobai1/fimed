require 'rails_helper'

RSpec.describe Treatment, type: :model do
  it { should belong_to(:patient) }

  it { should validate_presence_of(:display_name) }
  it { should validate_presence_of(:coding) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:covered_by_insurance) }
end
