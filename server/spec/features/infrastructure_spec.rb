require(File.expand_path('../spec_helper', File.dirname(__FILE__)))

feature 'Infrastructure' do 
  scenario 'going to home page' do
    visit('/')
    expect(current_url).to eq('http://www.example.com/')
  end
end