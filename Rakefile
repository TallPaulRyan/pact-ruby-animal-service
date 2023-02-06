$: << File.join(File.dirname(__FILE__), "lib")

require 'pact/tasks'

task :default => 'pact:verify'


desc 'Deploy to halo'
task :deploy_to_halo do
    p "Executing pact-broker record-deployment."
    environment = 'halo'
    participant = 'Animal Service'
    provider_version = ENV['GIT_COMMIT'] || `git rev-parse --short --verify HEAD`.strip
    # `pact-broker record-deployment --environment=#{environment} --pacticipant=#{participant} --version=#{provider_version} --broker-base-url=http://pact-broker:9292`
    p "pact-broker record-deployment --environment=#{environment} --pacticipant='#{participant}' --version=#{provider_version} --broker-base-url=http://pact-broker:9292"
    # p "Success! Recorded deployment of #{participant} to #{environment}!"
end