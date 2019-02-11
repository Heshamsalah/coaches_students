class DistributionController < ApplicationController
  before_action :set_lists

  def problem_one
    result = StudentDistributionHandler::ProblemOne.call(@students, @coaches)
    handle_response(result, :ok)
  end

  def problem_two
    result = StudentDistributionHandler::ProblemTwo.call(@students, @coaches)
    handle_response(result, :ok)
  end

  def problem_three
    result = StudentDistributionHandler::ProblemThree.call(@students, @coaches)
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
    @students = Student.where(id: permitted_params[:students_ids])
    @coaches = Coach.where(id: permitted_params[:coaches_ids])
  end
end
