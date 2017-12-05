class JSON_handler

  attr_reader :message

  def initialize
    @message = ''
  end

  def accept(message_body)
    message_body = verify_json(message_body)
    @message = message_body['message']
  end

  def verify_json(message_body)
    return JSON.parse(message_body.to_json)
  end

end
