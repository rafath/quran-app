# frozen_string_literal: true

Dir['./spec/shared_examples/**/*.rb'].sort.each { |shared_example| require shared_example }
Dir['./spec/shared_contexts/**/*.rb'].sort.each { |shared_context| require shared_context }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.profile_examples = 5
  config.order = :defined
end
