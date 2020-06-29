class CollectionsController < ApplicationController
  before_action :get_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = policy_scope(Collection)
    respond_to do |format|
      if params[:ajax].present?
        format.js
      end
      format.html
    end
  end

  def show
    authorize @collection
  end

  def new
    @collection = Collection.new
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    authorize @collection
    if @collection.save
      redirect_to collections_path
    end
  end

  def edit
    authorize @collection
  end

  def update
    authorize @collection
    if @collection.update(collection_params)
      render json: { success: true }
    else
      render json: { success: false, errors: @collection.errors.messages }, status: :unprocessable_entity 
    end
  end

  def destroy
    authorize @collection
    if @collection.delete
      redirect_to collections_path
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :user, :percentage)
  end

  def get_collection
    @collection = Collection.find(params[:id])
  end
end
