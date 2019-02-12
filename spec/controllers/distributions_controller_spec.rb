require 'rails_helper'

RSpec.describe DistributionsController, type: :controller do
  context 'Successfull calls' do
    it 'Problem One' do
      coaches = FactoryBot.create_list(:coach, 3).pluck(:id)
      students = FactoryBot.create_list(:student, 20).pluck(:id)

      params = {
        students_ids: students,
        coaches_ids: coaches
      }

      get :problem_one, params: params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq([7, 7, 6])
    end

    it 'Problem Two' do
      students = FactoryBot.create_list(:student, 25).pluck(:id)
      coaches = []
      coaches << FactoryBot.create(:coach_with_students, students_count: 2).id
      coaches << FactoryBot.create(:coach_with_students, students_count: 2).id
      coaches << FactoryBot.create(:coach_with_students, students_count: 7).id

      params = {
        students_ids: students,
        coaches_ids: coaches
      }

      get :problem_two, params: params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq([12, 12, 12])
    end

    it 'Problem Three' do
      students = FactoryBot.create_list(:student, 100).pluck(:id)
      coaches = []
      coaches << FactoryBot.create(:coach, capacity: 30)
      coaches << FactoryBot.create(:coach, capacity: 20)
      coaches << FactoryBot.create(:coach, capacity: 50)

      params = {
        students_ids: students,
        coaches_ids: coaches
      }

      get :problem_three, params: params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq([30, 20, 50])
    end
  end
end
