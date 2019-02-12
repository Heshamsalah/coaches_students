module Types
  module Arguments
    module Coach
      class UpdateCoachArguments < Types::BaseInputObject
        description 'Arguments for updating coach'

        argument :id, String, required: true
        argument :name, String, required: false
        argument :capacity, Int, required: false
        argument :students_ids, [String], required: false
      end
    end
  end
end
