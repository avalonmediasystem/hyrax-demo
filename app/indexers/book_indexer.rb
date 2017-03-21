class BookIndexer < Hyrax::WorkIndexer
  def generate_solr_document
    super.tap do |solr_doc|
      if object.creator.include? 'Carla Hayden'
        Solrizer.set_field(solr_doc, 'special_message', "She's the Librarian of Congress", :displayable)
      end
    end
  end
end
