# frozen_string_literal: true

require 'aws-sdk-secretsmanager'
require 'json'
require 'logger'
require 'ostruct'

#
# Startup
#
class Startup
  def initialize(port:)
    @port = port
    @logger = Logger.new(STDOUT)
  end

  def startup
    if development?
      set_environment
      create_db_tunnel
    end

    nil
  end

  def self.perform(&block)
    port = rand(5433..5499)
    ENV['DB_PORT'] = port.to_s
    new(port: port, &block).startup
  end

  private

  def development?
    ENV['RAILS_ENV'].nil? ||
      ENV['RAILS_ENV'] == 'development'
  end

  def production?
    ENV['RAILS_ENV'] == 'production'
  end

  def set_environment
    client = Aws::SecretsManager::Client.new(region: 'us-west-2')
    response = client.get_secret_value(secret_id: secret_name)
    secrets = JSON.parse(response.secret_string)

    secrets.each do |k, v|
      @logger.info("setting environment variable #{k}")
      ENV[k] = v
    end
  rescue Aws::SecretsManager::Errors => e
    raise e
  end

  def create_db_tunnel
    require 'net/ssh/gateway'
    options = OpenStruct.new(bastion: ENV['AWS_BASTION_IP'], ssh_key: ENV['AWS_PRIVATE_KEY'], dbproxy: ENV['DB_PROXY'])
    gateway(options)
    @logger.info("Connecting to DB on port #{@port} via SSH Gateway at #{options.dbproxy}")
  rescue StandardError => e
    @logger.error(e)
    @logger.info('Unable to connecto to database proxy. Set AWS_BASTION_IP, AWS_PRIVATE_KEY, DB_PROXY environment variables and try again.')
  end

  def gateway(options)
    Net::SSH::Gateway.new(
      options.bastion,
      'ec2-user',
      key_data: [options.ssh_key]
    ).open(options.dbproxy, 5432, @port)
  end

  def secret_name
    return 'amyandmartin'
  end
end
