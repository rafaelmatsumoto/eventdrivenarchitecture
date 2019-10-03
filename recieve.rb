require 'dotenv/load'
require 'mail'
require "google/cloud/pubsub"
project_id = "block-design-54210"
subscription_name = "simple-sub"
key_file = ENV['GCLOUD_KEY']

Mail.defaults do
  delivery_method :smtp, address: "localhost", port: 1025
end

pubsub = Google::Cloud::Pubsub.new project: project_id, keyfile: key_file

subscription = pubsub.subscription subscription_name
subscriber   = subscription.listen do |received_message|
  Mail.deliver do
    from     'mkt@superapontador.com'
    to       received_message.data
    subject  'Super apontador'
    body     'Obrigado por demonstrar interesse no super apontador, no momento o produto está em falta'
  end
  received_message.acknowledge!
end

subscriber.start
# Let the main thread sleep for 60 seconds so the thread for listening
# messages does not quit
sleep 60
subscriber.stop.wait!