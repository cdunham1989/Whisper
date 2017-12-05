require(File.expand_path('../spec_helper', File.dirname(__FILE__)))

feature 'Posting messages' do
  context 'submitting a valid message to server' do
    before do
      visit('/messages/new')
      fill_in :json_form_input, with: '{"message": "hello"}'
      click_button 'Submit'
    end

    scenario 'url should be confirmation page' do
      expect(current_url).to eq "http://www.example.com/messages/confirmation"
    end

    scenario 'should display confirmation as true' do
      expect(page).to have_content('true')
    end
  end

  context 'submitting an invalid message to server' do
    before do
      visit('/messages/new')
      fill_in :json_form_input, with: '{"message": ""}'
      click_button 'Submit'
    end

    scenario 'url should be confirmation page' do
      expect(current_url).to eq "http://www.example.com/messages/confirmation"
    end

    scenario 'should display confirmation as false' do
      expect(page).to have_content('false')
    end
  end
end
