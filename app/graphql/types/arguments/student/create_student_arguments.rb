module Types
  module Arguments
    module Student
      class CreateStudentArguments < Types::BaseInputObject
        description 'Arguments for creating student'

        argument :name, String, required: true
      end
    end
  end
end
