require 'rails_helper'

RSpec.describe StudentDistributionService::ProblemTwo, type: :service do
  context 'Successfull Scenarios' do
    it 'Case 1' do
      students = FactoryBot.create_list(:student, 10)
      coaches = []
      2.times.each do
        coaches << FactoryBot.create(:coach_with_students, students_count: 7)
      end
      coaches << FactoryBot.create(:coach_with_students, students_count: 6)

      result = StudentDistributionService::ProblemTwo.call(students, coaches)

      expect(result).to eq([10, 10, 10])
    end

    it 'Case 2' do
      students = FactoryBot.create_list(:student, 25)
      coaches = []
      coaches << FactoryBot.create(:coach_with_students, students_count: 2)
      coaches << FactoryBot.create(:coach_with_students, students_count: 2)
      coaches << FactoryBot.create(:coach_with_students, students_count: 7)

      result = StudentDistributionService::ProblemTwo.call(students, coaches)

      expect(result).to eq([12, 12, 12])
    end

    it 'Case 3' do
      students = []
      coaches = []
      coaches << FactoryBot.create(:coach_with_students, students_count: 2)
      coaches << FactoryBot.create(:coach_with_students, students_count: 2)
      coaches << FactoryBot.create(:coach_with_students, students_count: 7)

      expect { StudentDistributionService::ProblemOne.call(students, coaches) }.
        to raise_exception('Neither Students List nor Coaches List can\'t be empty')
    end
  end
end
