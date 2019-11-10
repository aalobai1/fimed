class Patient < ApplicationRecord
  has_many :treatments, dependent: :destroy
  validates_presence_of :family_name, :given_name, :gender, :race
end
