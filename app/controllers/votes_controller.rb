class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

  def index
    @votes = Vote.all

    render json: @votes.order("CREATED_AT DESC")
  end

  def show
    render json: @vote
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vote.destroy
    head :no_content
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
