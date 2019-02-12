module Queries
  module Student
    class Index < GraphQL::Function
      argument :page, !types.Int
      argument :per_page, !types.Int

      type types[Types::Resources::Student]

      def call(_obj, args, _ctx)
        StudentService::Serve.run(args.to_h.symbolize_keys, :index)
      end
    end
  end
end
