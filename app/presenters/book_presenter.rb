# app/presenters/book_presenter.rb
class BookPresenter < Hyrax::WorkShowPresenter
  def restrictions
    if solr_document.restrictions.first == 'nothing'
     "There are no restrictions on this object"
    else
      solr_document.restrictions
    end
  end
end
