module Types
  module Arguments
    module Student
      class UpdateStudentArguments < Types::BaseInputObject
        description 'Arguments for deleting student'

        argument :id, String, required: true
        argument :name, String, required: true
      end
    end
  end
end
