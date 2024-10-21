# frozen_string_literal: true

module Facts
  module Freebsd
    module Networking
      class Mac
        FACT_NAME = 'networking.mac'
        ALIASES = 'macaddress'

        def call_the_resolver
          fact_value = Facter::Resolvers::Networking.resolve(:mac)

          [Facter::ResolvedFact.new(FACT_NAME, fact_value), Facter::ResolvedFact.new(ALIASES, fact_value, :legacy)]
        end
      end
    end
  end
end
