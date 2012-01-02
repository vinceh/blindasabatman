class BatimagesController < ApplicationController

	protect_from_forgery

	require 'Datafy'

	def newImage

		@bat = Batimage.new
	end

	def createImage
		@bat = Batimage.new(params[:bat])
		@bat.show = true
		@bat.imageURL = params[:batimage][:imageURL]
		save_image(@bat)
		@bat.save

		redirect_to :controller => :main
	end

	def showImage
		@bat = Batimage.find_by_id(params[:id])
	end

	private

	def save_image(bat)
		name = "tmp/" + Admin.random_string(10) + ".png"
		File.open(name, "wb") { |f| f.write(Datafy::decode_data_uri(bat.imageURL)[0]) }
      	bat.thumbnail = File.open(name, "r")
	end
end
