require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do

  describe "GET #index" do
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected Courses" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body['data'].size).to eq(5)
    end
  end

  describe "GET #index with filter" do
    before do
      get :index, params: { filter: { self_assignable: true } }
    end

    it "response with JSON body containing expected Courses" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body['data'].size).to eq(5)
      expect(hash_body['data'].map { |json| json['attributes']['self-assignable'] }.uniq).to eq([true])
    end
  end

  describe "POST #create" do
    before do
      @request.env["CONTENT_TYPE"] = 'application/vnd.api+json'
      post :create, params: { data: { type: 'courses', "relationships": { "coach": { "data": { "type": "coaches", "id": Coach.first.id } } }, attributes: { 'name': 'New Course to Create', 'self-assignable': false } } }
    end

    it "response with JSON body containing expected Courses" do
      course = Course.last
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body['data']['attributes'].keys).to match_array(%w[name self-assignable])
      expect(hash_body['data']['id'].to_i).to eq(course.id)
      expect(hash_body['data']['attributes']).to match({
                                                         name: 'New Course to Create',
                                                         'self-assignable': false
                                                       })
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { id: course.id }
    end

    let(:course) { Course.create(name: 'New Course', self_assignable: true, coach: Coach.first) }

    it "response with JSON body containing expected Courses" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body['data']['attributes'].keys).to match_array(%w[name self-assignable])
      expect(hash_body['data']['id'].to_i).to eq(course.id)
      expect(hash_body['data']['attributes']).to match({
                                                         name: 'New Course',
                                                         'self-assignable': true
                                                       })
    end
  end
end