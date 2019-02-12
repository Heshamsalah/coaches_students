class DistributionsController < ApplicationController
  before_action :set_lists

  def problem_one
    result = StudentDistributionService::ProblemOne.call(@students, @coaches)
    handle_response(result, :ok)
  end

  def problem_two
    result = StudentDistributionService::ProblemTwo.call(@students, @coaches)
    handle_response(result, :ok)
  end

  def problem_three
    result = StudentDistributionService::ProblemThree.call(@students, @coaches)
    handle_response(result, :ok)
  end

  private

  def permitted_params
    params.permit(
      students_ids: [],
      coaches_ids: [],
    )
  end

  def set_lists
    @students = Student.where(id: permitted_params[:students_ids]).to_a
    @coaches = Coach.where(id: permitted_params[:coaches_ids]).to_a
  end
end
