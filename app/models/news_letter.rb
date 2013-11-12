class NewsLetter < ActiveRecord::Base
	mount_uploader :pdf, PdfUploader
end
