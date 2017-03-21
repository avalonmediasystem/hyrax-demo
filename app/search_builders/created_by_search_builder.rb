# app/models/created_by_search_builder.rb
class CreatedBySearchBuilder < ::SearchBuilder
  def for_users(solr_parameters)
    solr_parameters[:fq] ||= []
    solr_parameters[:fq] << "{!field f=creator_tesim v=#{blacklight_params[:q][:creator]}}"
  end
end
