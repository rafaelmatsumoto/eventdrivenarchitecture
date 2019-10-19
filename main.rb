# frozen_string_literal: true

require 'dotenv/load'
require './lib/publisher'
require 'faker'
topic_name = 'simple-topic'

pubsub = Publisher.get_publisher

topic = pubsub.topic topic_name
20.times do
  topic.publish Faker::Internet.email
end

puts 'Messages published.'
