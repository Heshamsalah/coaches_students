require 'rails_helper'

RSpec.describe StudentDistributionHandler::ProblemThree, type: :service do
  context 'Success' do
    it 'Should successd' do
      StudentDistributionHandler::ProblemThree.call
    end
  end
end
