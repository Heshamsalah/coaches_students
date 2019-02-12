module Queries
  module Student
    class Show < GraphQL::Function
      argument :id, !types.String

      type Types::Resources::Student

      def call(_obj, args, _ctx)
        StudentService::Serve.run(args.to_h.symbolize_keys, :show)
      end
    end
  end
end
