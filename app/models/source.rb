class Source < ApplicationRecord
  belongs_to :collection
  has_many :list_sources
  has_many :lists, through: :list_sources
end
