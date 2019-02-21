describe 'HTTParty' do
  #it 'content-type', vcr: {cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]} do # vide o porque do simbolo na linha 7
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do 

    # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/3").to_return(status: 200, body: "", headers: {'content-type':'application/json'})
    # VCR.use_cassette("jsonplaceholder/posts") do  --------> NÃO É MAIS NECESSÁRIO COM A INSERÇÃO DO         config.configure_rspec_metadata!
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1,2,3,4,5,6].sample}")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end
