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

  scenario 'it should close the connection between client and websocket' do
    visit('/')
    expect(page).to have_content('Socket State: 3 (close)')
  end

  scenario 'it should initialise the apps index view' do
    visit('/')
    expect(page).to have_content('Received: Connected to /')
  end

  scenario "it should take the user's message string and append it to the view content" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('hello')
  end

  scenario "it should throw an error when form input 'message' is an empty string" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('Please Enter a Message')
  end

  scenario "it should confirm that message has been recieved by server" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('Received: hello')
  end

  scenario "it should confirm that message has been sent to server" do
    visit('/')
    fill_in :message, with: 'hello\n'
    expect(page).to have_content('Sent: hello')
  end
end
