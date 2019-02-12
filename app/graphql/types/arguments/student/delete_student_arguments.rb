module Types
  module Arguments
    module Student
      class DeleteStudentArguments < Types::BaseInputObject
        description 'Arguments for deleting student'

        argument :id, String, required: true
      end
    end
  end
end
