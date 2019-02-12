require 'rails_helper'

RSpec.describe StudentDistributionService::ProblemThree, type: :service do
  context 'Success' do
    context 'Successfull Scenarios' do
      it 'Case 1' do
        students = FactoryBot.create_list(:student, 100)
        coaches = []
        coaches << FactoryBot.create(:coach, capacity: 30)
        coaches << FactoryBot.create(:coach, capacity: 20)
        coaches << FactoryBot.create(:coach, capacity: 50)

        result = StudentDistributionService::ProblemThree.
                 call(students, coaches)

        expect(result).to eq([30, 20, 50])
      end

      it 'Case 2' do
        students = FactoryBot.create_list(:student, 500)
        coaches = []
        coaches << FactoryBot.create(:coach, capacity: 10)
        coaches << FactoryBot.create(:coach, capacity: 40)
        coaches << FactoryBot.create(:coach, capacity: 50)

        result = StudentDistributionService::ProblemThree.
                 call(students, coaches)

        expect(result).to eq([50, 200, 250])
      end

      it 'Case 3' do
        students = []
        coaches = []
        coaches << FactoryBot.create(:coach, capacity: 30)
        coaches << FactoryBot.create(:coach, capacity: 20)
        coaches << FactoryBot.create(:coach, capacity: 50)

        expect {
          StudentDistributionService::ProblemThree.call(students, coaches)
        }.to raise_exception(
          'Neither Students List nor Coaches List can\'t be empty',
        )
      end
    end
  end
end
