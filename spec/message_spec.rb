# frozen_string_literal: true

require 'message'

RSpec.describe Message do
  it 'validates message has a name' do
    message = Message.new
    message.text = 'Hello Ruby'

    expect(message.text).to eq('Hello Ruby')
  end
end
