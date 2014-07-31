class PicturesController < ApplicationController
	def new
		@picture = current_gadget.pictures.new
	end
	def create
		@picture = current_gadget.pictures.new(picture_params)
		if @picture.save
			redirect_to current_gadget
		else
			render action: 'new'
		end
	end
	def show
		@size = size_params
		@picture = current_gadget.pictures.find(params[:id])
	end
	def destroy
		@picture =  current_gadget.pictures.find(params[:id])
		@picture.destroy
		redirect_to current_gadget
	end

	private
	def picture_params
		params.require(:picture).permit(:image)
	end
	def current_gadget
		current_user.gadgets.find(params[:gadget_id])
	end
	def size_params
		params[:size] || :medium
	end
end
