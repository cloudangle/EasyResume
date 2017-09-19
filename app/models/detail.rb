class Detail < ApplicationRecord
  belongs_to :detailable, polymorphic: true, optional: true
end
