class Batimage < ActiveRecord::Base

	attr_accessor :imageURL

	has_attached_file 	:thumbnail,
						:storage => :s3,
						:bucket => 'vvbatimage',
	                    :s3_credentials => {
							:access_key_id => 'AKIAI576XAU7SH57QZFA',
							:secret_access_key => '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'
						}

end
