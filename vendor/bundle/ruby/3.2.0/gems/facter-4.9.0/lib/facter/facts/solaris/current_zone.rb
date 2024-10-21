# frozen_string_literal: true

module Facts
  module Solaris
    class CurrentZone
      FACT_NAME = 'solaris_zones.current'
      ALIASES = 'zonename'

      def call_the_resolver
        fact_value = Facter::Resolvers::Solaris::ZoneName.resolve(:current_zone_name)

        [Facter::ResolvedFact.new(FACT_NAME, fact_value), Facter::ResolvedFact.new(ALIASES, fact_value, :legacy)]
      end
    end
  end
end
