module Types
  module Arguments
    module Coach
      class CreateCoachArguments < Types::BaseInputObject
        description 'Arguments for creating coach'

        argument :name, String, required: true
        argument :capacity, Int, required: false
        argument :students_ids, [String], required: false
      end
    end
  end
end
