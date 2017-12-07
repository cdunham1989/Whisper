require(File.expand_path('../spec_helper', File.dirname(__FILE__)))


feature 'WebSocket feature' do
  scenario 'it should attempt to intialise connection between client and websocket' do
    visit('/')
    expect(page).to have_content('Socket State: 0')
  end

  scenario 'it should establish a connection between client and websocket' do
    visit('/')
    expect(page).to have_content('Socket State: 1 (open)')
  end

  scenario 'it should close/ disconnect to the connection between client and websocket' do
    visit('/')
    expect(page).to have_content('Socket State: 3 (close)')
  end

  scenario 'it should intialise the apps index view' do
    visit('/')
    expect(page).to have_content('Received: Connected to /')
  end

  scenario "it takes the user's message string and appends it to the view content" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('hello')
  end

  scenario "it throws error when form input 'message' is an empty string" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('Please Enter a Message')
  end

  scenario "it confirms message has been recieved by server" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('Received: hello')
  end

  scenario "it confirms message has been sent to server" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('Sent: hello')
  end

end
