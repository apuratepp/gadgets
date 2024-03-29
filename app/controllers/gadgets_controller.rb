class GadgetsController < ApplicationController
	def index
		@view_params = view_params
		if search?
			@gadgets = current_user.gadgets.where("name like ?", search_params).includes(:pictures)
		else
			@gadgets = current_user.gadgets.includes(:pictures)
		end
	end
	def new
		@gadget = current_user.gadgets.new
	end
	def create
		@gadget = current_user.gadgets.new(gadget_params)
		if @gadget.save
			redirect_to @gadget
		else
			render action: 'new'
		end
	end
	def show
		@gadget = current_user.gadgets.find(params[:id])
	end
	def edit
		@gadget = current_user.gadgets.find(params[:id])
	end
	def update
		@gadget = current_user.gadgets.find(params[:id])
		if @gadget.update_attributes(gadget_params)
			redirect_to @gadget
		else
			render action: 'edit'
		end		
	end
	def destroy
		@gadget = current_user.gadgets.find(params[:id])
		if @gadget.destroy
			redirect_to gadgets_path
		else
			redirect_to @gadget
		end
	end

	private
	def gadget_params
		params.require(:gadget).permit(:name)
	end
	def search_params
		params[:seach]
	end
	def search?
		!search_params.blank?
	end
	def view_params
		params[:view_params] || 'list'
	end
end
