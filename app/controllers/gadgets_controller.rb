class GadgetsController < ApplicationController
	def index
		@gadgets = current_user.gadgets.includes(:pictures)
	end
end
