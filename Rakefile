$: << File.join(File.dirname(__FILE__), "lib")

require 'pact/tasks'

task :default => 'pact:verify'

namespace :env do
  desc 'list existing envs.'
  task :list do
    p "Listing exsiting environments via pact-broker list-environments."
    result = `pact-broker list-environments`
    puts result.strip
  end

  desc 'Create environment - rake env:create[<env>].'
  task :create, [:env] do |t, args|
    p "Creating #{args[:env]} env via pact-broker create-environment..."
    result = `pact-broker create-environment --name=#{args[:env]}`
    puts result.strip
  end

  desc 'Deploy to environment.'
  task :deploy, [:env] do |t, args|
    p "Executing pact-broker record-deployment..."
    participant = 'Animal Service'
    provider_version = ENV['GIT_COMMIT'] || `git rev-parse --short --verify HEAD`.strip
    result = `pact-broker record-deployment --environment=#{args[:env]} --pacticipant='#{participant}' --version=#{provider_version}`
    puts result.strip
  end

  desc 'can-i-deploy'
  task :canideploylatest, [:env] do |t, args|
    pacticipant = 'Animal Service'
    puts "pact-broker can-i-deploy --pacticipant='#{pacticipant}' --latest --to-environment=#{args[:env]}"
    result = `pact-broker can-i-deploy --pacticipant='#{pacticipant}' --latest --to-environment=#{args[:env]}`
    puts result.strip
  end

  desc 'can-i-deploy'
  task :canideployversion, [:env,:version] do |t, args|
    pacticipant = 'Animal Service'
    puts "pact-broker can-i-deploy --pacticipant='#{pacticipant}' --version=#{args[:version]} --to-environment=#{args[:env]}"
    result = `pact-broker can-i-deploy --pacticipant='#{pacticipant}' --version=#{args[:version]} --to-environment=#{args[:env]}`
    puts result.strip
  end


end