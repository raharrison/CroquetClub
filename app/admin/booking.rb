ActiveAdmin.register Booking do
  controller do
    def permitted_params
      params.permit(:booking => [:lawn_id, :time, :date, :booked])
    end
  end
end
