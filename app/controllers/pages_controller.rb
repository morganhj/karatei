class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  	if params[:query].present?
  		@sources = Source.search(params[:query]).results
  		respond_to do |format|
  			format.js
  		end
  	else
	  	@sources = current_user.list.sources if current_user
  	end
  end
end
