# frozen_string_literal: true

require 'logger'
require './lib/publisher'
subscription_name = 'simple-sub'

logger = Logger.new(STDOUT)

pubsub = Publisher.get_publisher

subscription = pubsub.subscription subscription_name
subscriber   = subscription.listen do |received_message|
  logger.info(received_message.data)
  received_message.acknowledge!
end

subscriber.start
# Let the main thread sleep for 60 seconds so the thread for listening
# messages does not quit
sleep
