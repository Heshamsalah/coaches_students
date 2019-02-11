module ResponseHandler
  extend ActiveSupport::Concern

  private

  def handle_response(result, status)
    render json: result.to_json, status: status
  end
end
