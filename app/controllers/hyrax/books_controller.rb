# Generated via
#  `rails generate hyrax:work Book`

module Hyrax
  class BooksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = Book
  end
end
