class Api::V1::SourcesController < ApplicationController
	def index
		sources = policy_scope(Source)
		if params[:query].present?
			sql_query = "url ILIKE :query OR title ILIKE :query"
			@sources = sources.where(sql_query, query: "%#{params[:query]}%").to_a
			@collections = policy_scope(Collection).where("title ILIKE :query", query: "%#{params[:query]}%")
			@collections.each do |collection|
				source = sources.where(collection: collection)
				@sources << source.first unless @sources.include?(source)
			end
			# @sources = policy_scope(Source).search(params[:query]).results
		else
			@sources = policy_scope(current_user.list.sources)
		end
	end
end
