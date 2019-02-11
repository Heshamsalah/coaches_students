class StudentsController < ApplicationController
  before_action :set_student, only: %i(show update destroy)

  def index
    result = Student.page(permitted_params[:page].to_i).per(permitted_params[:per_page].to_i)
    handle_response(result, :ok)
  end

  def show
    handle_response(@student, :ok)
  end

  def create
    @student = Student.create!(name: permitted_params[:name])
    handle_response(@student, :created)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  def update
    @student.update!(update_params)
    handle_response(@student, :ok)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  def destroy
    @student.destroy
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

  def set_student
    @student = Student.find(permitted_params[:id])
  rescue ActiveRecord::RecordNotFound => e
    handle_response({ msg: e.message }, 500)
  end
end
