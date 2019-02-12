module Mutations
  module Student
    class Delete < GraphQL::Function
      argument :attributes, Types::Arguments::Student::DeleteStudentArguments

      type types.Boolean

      def call(_obj, args, _ctx)
        StudentService::Serve.run(args[:attributes].to_h.symbolize_keys, :delete)
      end
    end
  end
end
