class List < ApplicationRecord
  belongs_to :user, optional: true
  has_many :list_sources
  has_many :sources, through: :list_sources

  def asign_sources_to_list(sources)
  	ListSource.where(list: self).delete_all
  	sources.each do |source|
	  	ListSource.create!(list: self, source: source)
  	end
  end
end
