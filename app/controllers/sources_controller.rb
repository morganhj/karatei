class SourcesController < ApplicationController
  before_action :get_source, only: [:show, :edit, :update, :destroy]

  def index
    @sources = Source.where(collection: params[:collection_id])
  end

  def show
    authorize @source
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @source = Source.new
    authorize @source
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @source = Source.new(source_params)
    @source.collection = @collection
    authorize @source
    if @source.save
      redirect_to collection_path(@collection)
    end
  end

  def edit
  end

  def update
    authorize @source
    if @source.update(source_params)
      redirect_to source_path(@source)
    end
  end

  def destroy
    @collection = Collection.find(params[:collection_id])
    authorize @source

    if @source.destroy
      respond_to do |format|
        format.html { redirect_to collection_path(@collection) }
        format.js
      end
    end
  end

  private

  def source_params
    params.require(:source).permit(:title, :url)
  end

  def get_source
    @source = Source.find(params[:id])
  end
end
