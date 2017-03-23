module Hyrax
  class ActorFactory
    def self.stack_actors(curation_concern)
      [Hyrax::Actors::TransactionalRequest,
       Hyrax::Actors::OptimisticLockValidator,
       Hyrax::Actors::MetadataEnrichmentActor,
       CreateWithRemoteFilesActor,
       CreateWithFilesActor,
       Hyrax::Actors::AddAsMemberOfCollectionsActor,
       Hyrax::Actors::AddToWorkActor,
       Hyrax::Actors::AssignRepresentativeActor,
       Hyrax::Actors::AttachFilesActor,
       Hyrax::Actors::ApplyOrderActor,
       Hyrax::Actors::InterpretVisibilityActor,
       DefaultAdminSetActor,
       ApplyPermissionTemplateActor,
       model_actor(curation_concern),
       # Initialize workflow after model is saved
       Hyrax::Actors::InitializeWorkflowActor]
    end

    def self.build(curation_concern, current_ability)
      Actors::ActorStack.new(curation_concern,
                             current_ability,
                             stack_actors(curation_concern))
    end

    def self.model_actor(curation_concern)
      actor_identifier = curation_concern.class.to_s.split('::').last
      "Hyrax::Actors::#{actor_identifier}Actor".constantize
    end
  end
end
