describe 'HTTParty' do
  it 'content-type', vcr: {cassette_name: 'jsonplaceholder/posts'} do # vide o porque do simbolo na linha 6
    # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/3").to_return(status: 200, body: "", headers: {'content-type':'application/json'})
    # VCR.use_cassette("jsonplaceholder/posts") do  --------> NÃO É MAIS NECESSÁRIO COM A INSERÇÃO DO         config.configure_rspec_metadata!
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end
