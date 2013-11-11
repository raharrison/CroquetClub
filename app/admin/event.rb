ActiveAdmin.register Event do
  controller do
    def permitted_params
      params.permit(:event => [:title, :description, :date])
    end
  end
end
