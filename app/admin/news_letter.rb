ActiveAdmin.register NewsLetter do
  controller do
    def permitted_params
      params.permit(:news_letter => [:title, :date, :pdf])
    end
  end
end
