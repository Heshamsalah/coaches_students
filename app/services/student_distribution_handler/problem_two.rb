module StudentDistributionHandler
  class ProblemTwo < Solutions
    class << self
      def call(students_list, coaches_list)
        if students_list.blank? || coaches_list.blank?
          raise 'Neither Students List nor Coaches List can\'t be empty'
        end

        assign_students_to_coaches(
          students_list,
          coaches_list,
          solution_two(coaches_list.size, students_list.size),
        )
      end
    end
  end
end
