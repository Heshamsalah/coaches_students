module StudentDistributionService
  # Given 3 coaches and 20 students, the distribution should be as follows:
  # Coach 1: 7
  # Coach 2: 7
  # Coach 3: 6

  class ProblemOne < StudentDistributionService::Solutions
    class << self
      def call(students_list, coaches_list)
        validate_presence_of(students_list, coaches_list)

        assign_students_to_coaches(
          students_list,
          coaches_list,
          solution_one(coaches_list.size, students_list.size),
        )
      end
    end
  end
end
