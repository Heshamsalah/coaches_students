require 'rails_helper'

RSpec.describe CoachesController, type: :controller do
  let!(:coaches) { create_list :coach, 50 }

  context 'Successfull calls' do
    it 'Should return paginated coaches list' do
      get :index, params: { page: 1, per_page: 10 }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'Should return one coach record' do
      coach = coaches.first
      get :show, params: { id: coach.id }

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res['name']).to eq(coach.name)
    end

    it 'Should create new coach record' do
      coach_name = Faker::Name.name
      post :create, params: { name: coach_name }

      expect(response).to have_http_status(:created)

      res = JSON.parse(response.body)
      expect(res['name']).to eq(coach_name)
    end

    it 'Should update an existing coach record' do
      coach = coaches.first
      old_name = coach.name
      new_name = 'New Name'

      put :update, params: { id: coach.id, name: new_name }

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res['name']).not_to eq(old_name)
      expect(res['name']).to eq(new_name)
    end

    it 'Should delete an existing coach record' do
      coach = coaches.first

      delete :destroy, params: { id: coach.id }

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res['msg']).to eq('Deleted Successfully')
    end
  end
end
