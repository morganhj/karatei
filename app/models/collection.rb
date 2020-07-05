
class Collection < ApplicationRecord
  belongs_to :user
  has_many :sources, dependent: :destroy

  def self.get_total_for_(user)
  	count = 0
  	self.where(user: user).each { |collection| count += collection.percentage }
  	return count
  end

  def get_percentage_of_total
  	total = Collection.get_total_for_(self.user)
  	percentage = self.percentage
  	return percentage * 100 / total.to_f
  end
end
