module StudentDistributionService
  class Solutions
    class << self
      # Solution for problem 1
      # inputs:
      #     coaches_count => integer represents number of coaches
      #     students_count => integer represents number of students
      # return:
      #     array represents final number of students per coach
      def solution_one(coaches_count, students_count)
        min_students_per_coach = students_count / coaches_count
        coaches_with_max_no_of_students = students_count % coaches_count
        coaches_with_min_no_of_students = coaches_count -
                                          coaches_with_max_no_of_students
        distributed_students_array(
          coaches_with_max_no_of_students,
          coaches_with_min_no_of_students,
          min_students_per_coach,
        )
      end

      def distributed_students_array(max, min, students_per_coach)
        result = []
        max.times.each { result << students_per_coach + 1 }
        min.times.each { result << students_per_coach }

        result
      end

      # Solution for problem 2
      # inputs:
      #     coaches => array contains number of students per each coach
      #     students => integer represents number of students
      # return:
      #     array represents final number of students per coach
      def solution_two(coaches, students)
        max_students_per_coach = coaches.max

        coaches.map! do |students_per_current_coach|
          students_needed = max_students_per_coach - students_per_current_coach
          students_diff = [students_needed, students].min
          students -= students_diff
          students_per_current_coach + students_diff
        end

        [coaches, solution_one(coaches.size, students)].transpose.map(&:sum)
      end

      # Solution for problem 3
      # inputs:
      #     coaches => array contains each coach capacity percentage
      #     students => integer represents number of students
      # return:
      #     array represents final number of students per coach
      def solution_three(coaches, students)
        remaining_students = 0

        coaches.map! do |capacity_per_coach|
          students_per_coach = capacity_per_coach * students * 0.01
          remaining_students += (students_per_coach - students_per_coach.floor)
          students_per_coach.floor
        end

        solution_two(coaches, remaining_students.to_i)
      end

      # Assign Students objects to Coaches in the database
      # inputs:
      #     students => array of students objects
      #     coaches => array coaches objects
      #     students_per_coach => array of integers represents the needed studes
      #                           per coach
      # return:
      #     array represents final number of students per coach
      def assign_students_to_coaches(students, coaches, students_per_coach)
        coaches.each_with_index do |coach, i|
          count = (coach.students.count - students_per_coach[i]).abs
          coach.students << students.pop(count)
        end

        coaches.map do |coach|
          coach.students.count
        end
      end

      def validate_presence_of(field_1, field_2)
        msg = 'Neither Students List nor Coaches List can\'t be empty'
        raise msg if field_1.blank? || field_2.blank?
      end
    end
  end
end
