class MainController < ApplicationController

	protect_from_forgery

	def index

		@images = Batimage.all
	end
end
