require_relative "./provider_states_for_zoo_app"

Pact.service_provider "Animal Service" do
  honours_pacts_from_pact_broker do
    # Base URL of pact broker is mandatory
    # basic auth username/password and token are optional parameters
    pact_broker_base_url 'http://pact-broker:9292'
    verbose true # Set this to true to see the HTTP requests and responses logged
    
    # Publishing verification results to broker
    publish_verification_results true

    # These are Provider side settings...Need to understand this better
    app_version "1.0.1"

    # This seems to do nothing?
    app_version_branch = "main_test"

    # Reference: https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors
    # Need to understand this better
    consumer_version_selectors [
      { "branch": "learning"},
      { "latest": true }
    ]

    # enable_pending true # See docs below
    # include_wip_pacts_since "2020-01-01" # See docs below
  end
 end