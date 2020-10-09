require 'exercise_3'

describe SayHello do
  let(:message_double) { double :message }
  let(:email_double) { 
    double :email, 
    message: message_double 
  }
  let(:email_client_double) {
    double :email_client_class, 
    new: email_double
  }

  it "creates a new email" do
    expect(email_client_double).to receive(:new)
    SayHello.new(email_client_double)
  end

  describe '#run' do
    it 'creates and sends a message' do
      email = SayHello.new(email_client_double)

      expect(email_double).to receive(:message)
      expect(message_double).to receive(:send)
      email.run
    end
  end
end