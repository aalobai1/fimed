require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should have_many(:treatments).dependent(:destroy) }

  it { should validate_presence_of(:given_name) }
  it { should validate_presence_of(:family_name) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:race) }
end
