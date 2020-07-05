require 'pry-byebug'
class User < ApplicationRecord
  after_create :create_associated_list
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :collections
  has_one :list, required: false
  has_many :sources, through: :collections

  def user_avatar
  	if self.avatar.attached?
  		self.avatar.key
  	else
  		"avatar"
  	end
  end

  def get_list_of_sources
    @collections = self.collections
    @collections_by_score = @collections.map{ |collection| { collection: collection, score: collection.get_percentage_of_total} }
    @sorted_collections = @collections_by_score.sort_by{|collection| collection[:score]}.reverse
    @sources = []
    @rounded_down = []
    (10..100).step(10).each do |score|
      @sorted_collections.each do |collection|
        if collection[:score].round(-1) >= score && @sources.count < 10
          collection[:collection].sources.each do |sourced|
            unless @sources.include?(sourced)
              @sources << sourced if @sources.count < 10
              break
            end
          end
        end
      end
    end
    return @sources
  end

  private

  def create_associated_list
    List.create!(user: self)
  end
end
