module Mutations
  module Student
    class Create < GraphQL::Function
      argument :attributes, Types::Arguments::Student::CreateStudentArguments

      type Types::Resources::Student

      def call(_obj, args, _ctx)
        StudentService::Serve.run(args[:attributes].to_h.symbolize_keys, :create)
      end
    end
  end
end
