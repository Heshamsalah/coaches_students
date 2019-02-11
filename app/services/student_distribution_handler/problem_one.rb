module StudentDistributionHandler
  # Given 3 coaches and 20 students, the distribution should be as follows:
  # Coach 1: 7
  # Coach 2: 7
  # Coach 3: 6

  class ProblemOne < Solutions
    class << self
      def call(students_list, coaches_list)
        if students_list.blank? || coaches_list.blank?
          raise 'Neither Students List nor Coaches List can\'t be empty'
        end

        assign_students_to_coaches(
          students_list,
          coaches_list,
          solution_one(coaches_list.size, students_list.size),
        )
      end
    end
  end
end
