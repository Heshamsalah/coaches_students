module Mutations
  module Coach
    class Create < GraphQL::Function
      argument :attributes, Types::Arguments::Coach::CreateCoachArguments

      type Types::Resources::Coach

      def call(_obj, args, _ctx)
        CoachService::Serve.run(args[:attributes].to_h.symbolize_keys, :create)
      end
    end
  end
end
