class CoachesController < ApplicationController
  before_action :set_coach, only: %i(show update destroy)

  def index
    result = Coach.page(permitted_params[:page].to_i).per(permitted_params[:per_page].to_i)
    handle_response(result, :ok)
  end

  def show
    handle_response(@coach, :ok)
  end

  def create
    @coach = Coach.create!(name: permitted_params[:name])
    handle_response(@coach, :created)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  def update
    @coach.update!(update_params)
    handle_response(@coach, :ok)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  def destroy
    @coach.destroy
    handle_response({ msg: 'Deleted Successfully' }, :ok)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  private

  def permitted_params
    params.permit(
      :id,
      :name,
      :page,
      :per_page,
    )
  end

  def update_params
    params.permit(:name)
  end

  def set_coach
    @coach = Coach.find(permitted_params[:id])
  rescue ActiveRecord::RecordNotFound => e
    handle_response({ msg: e.message }, 500)
  end
end
