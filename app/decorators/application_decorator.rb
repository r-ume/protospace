class ApplicationDecorator < Draper::Decorator

	def self.collection_decorator_class
		# let application decorator read PaginatingDecorator CLASS
		PaginatingDecorator
	end

end
