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
    @source.collection = @collection
    authorize @source
  end

  def create
    @source = Source.new(source_params)
    authorize @source
    if @source.save
      redirect_to sources_path
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
    authorize @source
    if @source.delete
      redirect_to sources_path
    end
  end

  private

  def source_params
    params.require(:source).permit(:title, :user, :percentage)
  end

  def get_source
    @source = source.find(params[:id])
  end
end
