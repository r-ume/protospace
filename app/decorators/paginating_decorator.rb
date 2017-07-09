class PaginatingDecorator < Draper::CollectionDecorator

	# decorator for paginateion
	delegate :current_page, :per_page, :offset, :total_entries, :total_pages

end
