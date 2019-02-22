require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it '# responds successfully' do
    get :index
    puts response
    #expect(response).to be_successful ---> pode ser usado e atende como o codigo abaixo
    expect(response).to have_http_status '200'
  end
end
