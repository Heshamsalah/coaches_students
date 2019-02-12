module Queries
  module Coach
    class Index < GraphQL::Function
      argument :page, !types.Int
      argument :per_page, !types.Int

      type types[Types::Resources::Coach]

      def call(_obj, args, _ctx)
        CoachService::Serve.run(args.to_h.symbolize_keys, :index)
      end
    end
  end
end
