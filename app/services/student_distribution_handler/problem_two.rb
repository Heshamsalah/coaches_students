module StudentDistributionHandler
  # Some coaches may already have students.

  # Given 3 coaches:
  # Coach 1: 7 students
  # Coach 2: 7 students
  # Coach 3: 6 students

  # And given a new list of 10 students, the final distribution would be:
  # Coach 1: 10 students
  # Coach 2: 10 students
  # Coach 3: 10 students

  class ProblemTwo < Solutions
    class << self
      def call(students_list, coaches_list)
        if students_list.blank? || coaches_list.blank?
          raise 'Neither Students List nor Coaches List can\'t be empty'
        end

        assign_students_to_coaches(
          students_list,
          coaches_list,
          solution_two(coaches_list, students_list.size),
        )
      end
    end
  end
end
