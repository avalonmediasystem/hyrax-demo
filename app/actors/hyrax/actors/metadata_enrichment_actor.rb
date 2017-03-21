module Hyrax
  module Actors
    class MetadataEnrichmentActor < Hyrax::Actors::BaseActor
      def create(attributes)
        enrich_metadata(attributes) && next_actor.create(attributes)
      end

      private
        def enrich_metadata(attributes)
          if attributes.fetch(:creator).include?("Carla Hayden")
            attributes[:description] << "She's the Librarian of Congress"
          end
          true
        end
    end
  end
end
