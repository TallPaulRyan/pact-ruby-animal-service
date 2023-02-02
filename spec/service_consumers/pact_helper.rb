require_relative "./provider_states_for_zoo_app"
require_relative "./provider_states_for_cat_food_app"


# The git commands are just for local testing, not needed for real CI
provider_version = ENV['GIT_COMMIT'] || `git rev-parse --short --verify HEAD`.strip
provider_branch = ENV['GIT_BRANCH'] || `git name-rev --name-only HEAD`.strip
# publish_results = ENV['CI'] == 'true' # results should only be published from CI
# Will publish locally for now
publish_results = true
# choose the appropriate credentials for your broker
credentials = {
  username: ENV['PACT_BROKER_USERNAME'],
  password: ENV['PACT_BROKER_PASSWORD'],
  token: ENV['PACT_BROKER_TOKEN']
}.compact

Pact.service_provider "example-provider" do
  app_version provider_version
  app_version_branch provider_branch
  publish_verification_results publish_results

  honours_pacts_from_pact_broker do
    pact_broker_base_url 'http://pact-broker:9292', credentials

    consumer_version_selectors [
        # { main_branch: true },
        { matching_branch: false }, # Same branch name as consumer - probably won't work for us?
        { deployed_or_released: true }
    ]

    # Not clear what these do - disabling for now
    # enable_pending true
    # include_wip_pacts_since provider_branch == "main" ? "2020-01-01" : nil
  end
end
