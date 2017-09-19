class Education < ApplicationRecord
  belongs_to :resume
  has_many :details, as: :detailable, dependent: :destroy

  accepts_nested_attributes_for :details, allow_destroy: true, reject_if: lambda { |d| d[:content].blank? }
end
