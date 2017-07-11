class ApplicationDecorator < Draper::Decorator

	def self.collection_decorator_class
		PaginatingDecorator # let application decorator read PaginatingDecorator CLASS
	end

end
