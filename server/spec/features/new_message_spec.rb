require(File.expand_path('../spec_helper', File.dirname(__FILE__)))

feature 'Posting messages' do
  before do
    visit('/messages/new')
    fill_in :json, with: "{'message': 'hello'}"
    click_button 'Submit'
  end

  scenario 'url should be confirmation page' do
    expect(current_url).to eq "http://www.example.com/messages/confirmation"
  end

  scenario 'should display confirmation json' do
    expect(page).to have_content('true')
  end


end