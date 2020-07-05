class ListsController < ApplicationController
  def update
  	@list = current_user.list
  	authorize @list
  	@sources = current_user.get_list_of_sources
  	@list.asign_sources_to_list(@sources)
  	redirect_to root_path
  end
end
