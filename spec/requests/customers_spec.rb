require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! 200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end
    
    it "JSON 200 OK" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id:	/\d/,
        name:	(be_kind_of String),
        email: (be_kind_of String)
      ])
    end

    it "show - JSON" do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id:	/\d/,
        name:	(be_kind_of String),
        email:(be_kind_of String)
      )
    end

    it "show - RSpec + JSON (puro)" do
      get "/customers/1.json"
      response_body = JSON.parse(response.body)
      expect(response_body.fetch('id')).to eq(1)
      expect(response_body.fetch('name')).to be_kind_of(String)
      expect(response_body.fetch('email')).to be_kind_of(String)
    end

  end

  describe "POST /customers" do
    it 'create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = {"ACCEPT"=>"application/json"}

      customers_params = attributes_for(:customer)

      post '/customers.json', params: {customer: customers_params}, headers: headers

      expect(response.body).to include_json(
        id:	/\d/,
        name:	customers_params.fetch(:name),
        email:customers_params.fetch(:email)
      )
    end
  end

  describe "PATCH /customers" do
    it 'update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = {"ACCEPT"=>"application/json"}

      customers = Customer.first
      customers.name += " - update"

      patch "/customers/#{customers.id}.json", params: {customer: customers.attributes}, headers: headers

      expect(response.body).to include_json(
        id:	/\d/,
        name:	customers.name,
        email:customers.email
      )
    end
  end

  describe "DELETE /customers" do
    it 'destroy - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = {"ACCEPT"=>"application/json"}

      customers = Customer.first

      expect{delete "/customers/#{customers.id}.json", headers: headers}.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end  
end
