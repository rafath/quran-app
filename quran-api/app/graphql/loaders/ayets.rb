module Loaders
  class Ayets < GraphQL::Batch::Loader
    # Define `initialize` to store grouping arguments, eg
    #
    #     Loaders::Ayets.for(group).load(value)
    #
    # def initialize()
    # end

    # `keys` contains each key from `.load(key)`.
    # Find the corresponding values, then
    # call `fulfill(key, value)` or `fulfill(key, nil)`
    # for each key.
    def perform(keys)
    end
  end
end
