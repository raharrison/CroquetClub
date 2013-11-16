class NewsLetter < ActiveRecord::Base
	mount_uploader :pdf, PdfUploader
    validates_presence_of :title, :date, :pdf
end
