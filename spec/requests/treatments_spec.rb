require 'rails_helper'

RSpec.describe 'Treatments API' do
  let!(:patient) { create(:patient) }
  let!(:treatments)  { create_list(:treatment, 20, patient_id: patient.id) }
  let(:patient_id) { patient.id }
  let(:id) { treatments.first.id }

  describe 'GET /patients/:patient_id/treatments' do
    before { get "/patients/#{patient_id}/treatments" }

    context 'when patient exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all patient treatments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when patient does not exist' do
      let(:patient_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(422)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Patient/)
      end
    end
  end

  # Test suite for GET /todos/:todo_id/items/:id
  describe 'GET /patients/:patient_id/treatment/:id' do
    before { get "/patients/#{patient_id}/treatments/#{id}" }

    context 'when patient treatment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when patient treatment does not exist' do
      let(:id) { 0 }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Treatment/)
      end
    end

  end

  # Test suite for PUT /todos/:todo_id/items
  describe 'POST /patients/:patient_id/treatments' do
    let(:valid_attributes) do
      {
        display_name: 'Visit Narnia',
        coding: 'snomed',
        code: '20392',
        covered_by_insurance: false
      }
    end

    context 'when request attributes are valid' do
      before {
        post "/patients/#{patient_id}/treatments", params: valid_attributes
      }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for PUT /patients/:patient_id/treatments/:id
  describe 'PUT /patients/:patient_id/treatments/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/patients/#{patient_id}/treatments/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Mozart/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /patients/:id
  describe 'DELETE /patients/:id' do
    before { delete "/patients/#{patient_id}/treatments/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
