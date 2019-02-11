require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let!(:students) { create_list :student, 50 }

  context 'Successfull calls' do
    it 'Should return paginated students list' do
      get :index, params: { page: 1, per_page: 10 }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'Should return one student record' do
      student = students.first
      get :show, params: { id: student.id }

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res['name']).to eq(student.name)
    end

    it 'Should create new student record' do
      student_name = Faker::Name.name
      post :create, params: { name: student_name }

      expect(response).to have_http_status(:created)

      res = JSON.parse(response.body)
      expect(res['name']).to eq(student_name)
    end

    it 'Should update an existing student record' do
      student = students.first
      old_name = student.name
      new_name = 'New Name'

      put :update, params: { id: student.id, name: new_name }

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res['name']).not_to eq(old_name)
      expect(res['name']).to eq(new_name)
    end

    it 'Should delete an existing student record' do
      student = students.first

      delete :destroy, params: { id: student.id }

      expect(response).to have_http_status(:ok)

      res = JSON.parse(response.body)
      expect(res['msg']).to eq('Deleted Successfully')
    end
  end
end
