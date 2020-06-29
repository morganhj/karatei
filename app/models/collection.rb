class Collection < ApplicationRecord
  belongs_to :user
  has_many :sources, dependent: :destroy
end
