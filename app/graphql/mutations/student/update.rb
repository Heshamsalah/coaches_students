module Mutations
  module Student
    class Update < GraphQL::Function
      argument :attributes, Types::Arguments::Student::UpdateStudentArguments

      type Types::Resources::Student

      def call(_obj, args, _ctx)
        params = args[:attributes].to_h.symbolize_keys
        StudentService::Serve.run(
          {
            update_params: params.delete_if { |k, _v|
              k == :id || k == :coaches_ids
            }
          }.merge(args[:attributes].to_h.symbolize_keys),
          :update,
        )
      end
    end
  end
end
