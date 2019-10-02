require 'dotenv/load'
require "google/cloud/pubsub"
project_id = "block-design-54210"
subscription_name = "simple-sub"
key_file = ENV['GCLOUD_KEY']

pubsub = Google::Cloud::Pubsub.new project: project_id, keyfile: key_file

subscription = pubsub.subscription subscription_name
subscriber   = subscription.listen do |received_message|
  puts "Received message: #{received_message.data}"
  received_message.acknowledge!
end

subscriber.start
# Let the main thread sleep for 60 seconds so the thread for listening
# messages does not quit
sleep 60
subscriber.stop.wait!