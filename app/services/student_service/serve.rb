module StudentService
  class Serve < ServiceBase
    class << self
      def index
        Student.page(args[:page].to_i).per(args[:per_page].to_i)
      end

      def show
        Student.find(args[:id])
      end

      def create
        Student.create!(name: args[:name])
      end

      def update
        student = show
        update_args = args[:update_params].delete_if { |_k, v| v.blank? }
        student.update!(update_args)
        student
      end

      def delete
        student = show
        student.destroy
      end
    end
  end
end
