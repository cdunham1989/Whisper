require(File.expand_path('../spec_helper', File.dirname(__FILE__)))
require(File.expand_path('../../app/lib/ruby/json_handler', File.dirname(__FILE__)))

describe JSON_handler do
  it 'should set instance variable of message' do
    subject.accept('{"message": "my message"}')
    expect(subject.message).to eq 'my message'
  end
end
