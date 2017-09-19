class Resume < ApplicationRecord

  has_one :selfintro, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :experiences, dependent: :destroy

  accepts_nested_attributes_for :selfintro
  accepts_nested_attributes_for :educations, allow_destroy: true, reject_if: lambda { |e| e[:university].blank? }
  accepts_nested_attributes_for :works, allow_destroy: true, reject_if: lambda { |w| w[:title].blank? }
  accepts_nested_attributes_for :experiences, allow_destroy: true, reject_if: lambda { |e| e[:org].blank? }

  validates :resumeid, presence: true, length: { minimum: 4, maximum: 20 }


end
