class TilsController < ApplicationController
  before_action :set_til, only: [:show, :update, :destroy]

  def index
    @tils = Til.all

    render json: @tils.order("CREATED_AT DESC")
  end

  def show
    render json: @til
  end

  def create
    @til = Til.new(til_params)

    if @til.save
      render json: @til, status: :created, location: @til
    else
      render json: @til.errors, status: :unprocessable_entity
    end
  end

  private
    def set_til
      @til = Til.find(params[:id])
    end

    def til_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
