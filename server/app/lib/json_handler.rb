class JSON_handler

  attr_reader :message

  def initialize
    @message = ''
  end

  def accept(message)
    @message = message[:message]
  end
end