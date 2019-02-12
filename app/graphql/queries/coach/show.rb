module Queries
  module Coach
    class Show < GraphQL::Function
      argument :id, !types.String

      type Types::Resources::Coach

      def call(_obj, args, _ctx)
        CoachService::Serve.run(args.to_h.symbolize_keys, :show)
      end
    end
  end
end
