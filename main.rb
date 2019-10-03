require 'dotenv/load'
require "google/cloud/pubsub"
require "faker"
project_id = "block-design-54210"
key_file = ENV['GCLOUD_KEY']
topic_name = "simple-topic"

pubsub = Google::Cloud::Pubsub.new project: project_id, keyfile: key_file

topic = pubsub.topic topic_name
topic.publish 'rafael@teste.com'

puts "Messages published."

