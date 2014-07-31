class Gadget < ActiveRecord::Base
	belongs_to :user
	has_many   :pictures, :dependent => :delete_all
end
