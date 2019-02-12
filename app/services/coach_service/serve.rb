module CoachService
  class Serve < ServiceBase
    class << self
      def index
        Coach.page(args[:page].to_i).per(args[:per_page].to_i)
      end

      def show
        Coach.find(args[:id])
      end

      def create
        Coach.create!(name: args[:name])
      end

      def update
        coach = show
        update_args = args[:update_params].delete_if { |_k, v| v.blank? }
        coach.update!(update_args)
        coach
      end

      def delete
        coach = show
        coach.destroy
      end
    end
  end
end
