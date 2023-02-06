$: << File.join(File.dirname(__FILE__), "lib")

require 'pact/tasks'

task :default => 'pact:verify'


desc 'Deploy to halo'
task :deploy_to_halo do
    p "Executing pact-broker record-deployment."
    environment = 'halo'
    participant = 'Animal Service'
    provider_version = ENV['GIT_COMMIT'] || `git rev-parse --short --verify HEAD`.strip
    result = `pact-broker record-deployment --environment=#{environment} --pacticipant='#{participant}' --version=#{provider_version}`
    puts result.strip
end