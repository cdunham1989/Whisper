require 'json'
class JSON_handler

  attr_reader :message

  def initialize
    @message = ''
  end

  def accept(json)
    message_body = verify_json(json)
    @message = message_body["message"]
  end

  def confirmation
    (@message != '' && !!@message).to_s
  end

  private

  def verify_json(message_body)
    return JSON.parse(message_body)
  end
end
