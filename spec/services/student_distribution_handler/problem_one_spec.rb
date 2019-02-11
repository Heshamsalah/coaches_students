require 'rails_helper'

RSpec.describe StudentDistributionHandler::ProblemOne, type: :service do
  context 'Successfull Scenarios' do
    it 'Case 1' do
      students = FactoryBot.create_list(:student, 20)
      coaches = FactoryBot.create_list(:coach, 3)

      result = StudentDistributionHandler::ProblemOne.call(students, coaches)

      expect(result).to eq([7, 7, 6])
    end

    it 'Case 2' do
      students = FactoryBot.create_list(:student, 21)
      coaches = FactoryBot.create_list(:coach, 3)

      result = StudentDistributionHandler::ProblemOne.call(students, coaches)

      expect(result).to eq([7, 7, 7])
    end

    it 'Case 3' do
      students = FactoryBot.create_list(:student, 20)
      coaches = FactoryBot.create_list(:coach, 4)

      result = StudentDistributionHandler::ProblemOne.call(students, coaches)

      expect(result).to eq([5, 5, 5, 5])
    end

    it 'Case 4' do
      students = []
      coaches = FactoryBot.create_list(:coach, 4)

      expect { StudentDistributionHandler::ProblemOne.call(students, coaches) }.
        to raise_exception('Neither Students List nor Coaches List can\'t be empty')
    end

    it 'Case 4' do
      students = FactoryBot.create_list(:student, 20)
      coaches = FactoryBot.create_list(:coach, 1)

      result = StudentDistributionHandler::ProblemOne.call(students, coaches)

      expect(result).to eq([20])
    end
  end
end
