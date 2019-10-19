# frozen_string_literal: true

require 'pry'
require 'google/cloud/pubsub'
require 'dotenv/load'

class Publisher
  @project_id = ENV['GCLOUD_PROJECT_ID']
  @key_file = ENV['GCLOUD_KEY']

  def self.get_publisher
    Google::Cloud::Pubsub.new project: @project_id, keyfile: @key_file
  end
end
