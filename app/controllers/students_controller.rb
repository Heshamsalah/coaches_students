class StudentsController < ApplicationController
  def index
    result = StudentService::Serve.run(permitted_params, :index)
    handle_response(result, :ok)
  end

  def show
    result = StudentService::Serve.run(permitted_params, :show)
    handle_response(result, :ok)
  end

  def create
    result = StudentService::Serve.run(permitted_params, :create)
    handle_response(result, :created)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  def update
    modified_params = permitted_params.merge(update_params: update_params)
    result = StudentService::Serve.run(modified_params, :update)
    handle_response(result, :ok)
  rescue StandardError => e
    handle_response({ msg: e.message }, 500)
  end

  def destroy
    StudentService::Serve.run(permitted_params, :delete)
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
end
