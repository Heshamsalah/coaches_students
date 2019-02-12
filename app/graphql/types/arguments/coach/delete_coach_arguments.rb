module Types
  module Arguments
    module Coach
      class DeleteCoachArguments < Types::BaseInputObject
        description 'Arguments for deleting coach'

        argument :id, String, required: true
      end
    end
  end
end
