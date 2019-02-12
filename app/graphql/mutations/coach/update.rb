module Mutations
  module Coach
    class Update < GraphQL::Function
      argument :attributes, Types::Arguments::Coach::UpdateCoachArguments

      type Types::Resources::Coach

      def call(_obj, args, _ctx)
        params = args[:attributes].to_h.symbolize_keys
        CoachService::Serve.run(
          {
            update_params: params.delete_if { |k, _v|
              k == :id || k == :students_ids
            }
          }.merge(args[:attributes].to_h.symbolize_keys),
          :update,
        )
      end
    end
  end
end
