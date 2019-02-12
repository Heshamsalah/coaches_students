module Mutations
  module Coach
    class Delete < GraphQL::Function
      argument :attributes, Types::Arguments::Coach::DeleteCoachArguments

      type types.Boolean

      def call(_obj, args, _ctx)
        CoachService::Serve.run(args[:attributes].to_h.symbolize_keys, :delete)
      end
    end
  end
end
