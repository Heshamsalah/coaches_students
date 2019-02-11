class Solutions
  class << self
    def solution_one(coaches_count, students_count)
      min_students_per_coach = students_count / coaches_count

      max_students_per_coach = min_students_per_coach + 1

      max_coaches = students_count % coaches_count

      min_coaches = coaches_count - max_coaches

      Array.new(max_coaches, max_students_per_coach) +
        Array.new(min_coaches, min_students_per_coach)
    end

    def solution_two(coaches, students)
      students_per_coach_list = coaches.map do |coach|
        coach.students.count
      end

      max_students_per_coach = students_per_coach_list.max
      coaches_count = students_per_coach_list.size

      students_per_coach_list.map! do |students_per_current_coach|
        students_needed = max_students_per_coach - students_per_current_coach
        students_diff = [students_needed, students].min
        students -= students_diff
        students_per_current_coach + students_diff
      end

      students_per_coach_list.zip(
        solution_one(coaches_count, students),
      ).map(&:sum)
    end

    def solution_three(coaches, students)
      extra_students = 0

      coaches.map! do |n|
        percentage = n * 0.01
        students_for_this_coach = percentage * students
        extra_students += (students_for_this_coach - students_for_this_coach.floor)
        students_for_this_coach.floor
      end

      solution_two(coaches, extra_students.to_i)
    end

    def assign_students_to_coaches(students, coaches, students_per_coach)
      coaches.each_with_index do |coach, i|
        count = (coach.students.count - students_per_coach[i]).abs
        coach.students << students.pop(count)
      end

      coaches.map do |coach|
        coach.students.count
      end
    end
  end
end
