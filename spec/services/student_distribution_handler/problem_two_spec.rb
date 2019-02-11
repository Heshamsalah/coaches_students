require 'rails_helper'

RSpec.describe StudentDistributionHandler::ProblemTwo, type: :service do
  context 'Success' do
    it 'Should successd' do
      StudentDistributionHandler::ProblemTwo.call
    end
  end
end
