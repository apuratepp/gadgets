class Picture < ActiveRecord::Base
	belongs_to :gadget

	# paperclip
	has_attached_file :image, 
					  default_url: "/images/missing.png", 
					  styles: {
					      thumb: "64x48#",
					      medium: "640x480#",
					      big: "1280x960#"
					  }

  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
