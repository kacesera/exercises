# Amend `SayHello` to be testable in isolation, then write the tests for it.

# ```ruby
# class EmailClient
#   def message
#     Message.new
#   end
# end

# class Message
#   def send(to, body)
#     # Imagine I'm sending an email
#   end
# end

# class SayHello
#   def run
#     email = EmailClient.new
#     email.message.send(
#       "friend@example.com",
#       "HELLO!"
#     )
#   end
# end
# ```

class EmailClient
  def message
    Message.new
  end
end
  
class Message
  def send(to, body)
    # Imagine I'm sending an email
  end
end
  
class SayHello
  def initialize(email = EmailClient)
    @email = email.new
  end

  def run(email = "friend@example.com", message = "HELLO!")
    @email.message.send(email, message)
  end
end
