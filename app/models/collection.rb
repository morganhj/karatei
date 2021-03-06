class Collection < ApplicationRecord
  searchkick
  belongs_to :user
  has_many :sources, dependent: :destroy

  def self.get_total_for_(user)
  	count = 0
  	self.where(user: user).each { |collection| count += collection.percentage }
  	return count
  end

  def get_percentage_of_total
    answer = 0
  	total = Collection.get_total_for_(self.user)
  	percentage = self.percentage
  	answer = percentage * 100 / total.to_f unless total.to_f.zero?
    return answer
  end
end
