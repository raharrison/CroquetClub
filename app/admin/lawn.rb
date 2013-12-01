ActiveAdmin.register Lawn do
  controller do
    def permitted_params
      params.permit(:lawn => [:description])
    end
  end
end
